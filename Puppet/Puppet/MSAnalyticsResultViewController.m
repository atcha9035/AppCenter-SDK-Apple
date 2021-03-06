/*
 * Copyright (c) Microsoft Corporation. All rights reserved.
 */

#import "Constants.h"
#import "EventLog.h"
#import "MSAnalyticsResultViewController.h"

@interface MSAnalyticsResultViewController ()

@property (weak, nonatomic) IBOutlet UILabel *eventNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventPropsLabel;
@property (weak, nonatomic) IBOutlet UILabel *didSentEventLabel;
@property (weak, nonatomic) IBOutlet UILabel *didSendingEventLabel;
@property (weak, nonatomic) IBOutlet UILabel *didFailedToSendEventLabel;

@end

@implementation MSAnalyticsResultViewController

#pragma mark - View controller

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(willSendEventLog:)
                                                 name:kWillSendEventLog
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didSucceedSendingEventLog:)
                                                 name:kDidSucceedSendingEventLog
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didFailSendingEventLog:)
                                                 name:kDidFailSendingEventLog
                                               object:nil];
  }
  return self;
}

-(void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Callbacks

-(void)willSendEventLog:(NSNotification *) notification {
  dispatch_async(dispatch_get_main_queue(), ^{
    id log = notification.object;
    self.eventNameLabel.text = [log eventName];
    self.eventPropsLabel.text = [NSString stringWithFormat:@"%tu", [log properties].count];
    self.didSendingEventLabel.text = kDidSendingEventText;
    [self reloadCells];
  });
}

-(void)didSucceedSendingEventLog:(NSNotification *) notification {
  dispatch_async(dispatch_get_main_queue(), ^{
    id log = notification.object;
    self.eventNameLabel.text = [log eventName];
    self.eventPropsLabel.text = [NSString stringWithFormat:@"%tu", [log properties].count];
    self.didSentEventLabel.text = kDidSentEventText;
    [self reloadCells];
  });
}

-(void)didFailSendingEventLog:(NSNotification *) notification {
  dispatch_async(dispatch_get_main_queue(), ^{
    id log = notification.object;
    self.eventNameLabel.text = [log eventName];
    self.eventPropsLabel.text = [NSString stringWithFormat:@"%tu", [log properties].count];
    self.didFailedToSendEventLabel.text = kDidFailedToSendEventText;
    [self reloadCells];
  });
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
  switch(indexPath.section) {
    case 1:
      switch (indexPath.row) {
        case 0:
          self.eventNameLabel.text = @"";
          self.eventPropsLabel.text = @"";
          self.didSentEventLabel.text = @"";
          self.didSendingEventLabel.text = @"";
          self.didFailedToSendEventLabel.text = @"";
          break;
        default:
          break;
      }
      break;
    default:
      break;
  }
}

- (void)reloadCells {
  NSMutableArray<NSIndexPath*> *rows = [NSMutableArray new];
  int rowsInSection = (int)[self.tableView numberOfRowsInSection:0];
  for(int row = 0; row < rowsInSection; ++row) {
    [rows addObject:[NSIndexPath indexPathForRow:row inSection:0]];
  }
  [self.tableView reloadRowsAtIndexPaths:rows
                        withRowAnimation:UITableViewRowAnimationNone];
}

@end
