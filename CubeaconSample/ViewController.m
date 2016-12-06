//
//  ViewController.m
//  CubeaconSample
//
//  Created by Eyro Labs on 12/6/16.
//  Copyright © 2016 Eyro Labs. All rights reserved.
//

#import "ViewController.h"
#import <Cubeacon/Cubeacon.h>

@interface ViewController () <UITableViewDataSource, CBBeaconManagerDelegate, CBBluetoothManagerDelegate>

@property (nonatomic, strong) CBBluetoothManager *bluetoothManager;
@property (nonatomic, strong) CBBeaconManager *beaconManager;
@property (nonatomic, strong) NSArray<CBBeacon*> *beacons;
@property (nonatomic, strong) CBRegion *region;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bluetoothManager = [[CBBluetoothManager alloc] initWithDelegate:self];
    
    self.beaconManager = [[CBBeaconManager alloc] init];
    self.beaconManager.delegate = self;
    self.region = [[CBRegion alloc] initWithProximityUUID:[[NSUUID alloc] initWithUUIDString:CUBEACON_UUID]
                                                    major:1
                                                    minor:1
                                               identifier:@"com.eyro.cubeacon"];
    self.region.notifyEntryStateOnDisplay = YES;
    self.region.notifyOnEnter = YES;
    self.region.notifyOnExit = YES;
    
    [self.beaconManager requestAlwaysAuthorization];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.beaconManager startRangingBeaconsInRegion:self.region];
    [self.beaconManager startMonitoringForRegion:self.region];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self.beaconManager stopRangingBeaconsInRegion:self.region];
}

- (void)didRangeBeacons:(NSArray<CBBeacon *> *)beacons inRegion:(CBRegion *)region {
    self.beacons = [NSArray arrayWithArray:beacons];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.beacons.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellBeacon" forIndexPath:indexPath];
    
    CBBeacon *beacon = self.beacons[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"M=%ld, m=%ld, RSSI=%ld(%.2fm)", (long)beacon.major, (long)beacon.minor, (long)beacon.rssi, beacon.accuracy];
    cell.detailTextLabel.text = [beacon.proximityUUID UUIDString];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"Found beacons=%ld", (unsigned long)self.beacons.count];
}

- (void)bluetoothManagerDidUpdateState:(CBBluetoothManager *)manager {
    
    switch (manager.state) {
        case CBBluetoothStateUnknown:
            break;
            
        default:
            break;
    }
}

@end
