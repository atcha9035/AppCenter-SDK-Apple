#import "MSServiceAbstract.h"
#import "MSServiceInternal.h"

@interface MSMockService : MSServiceAbstract <MSServiceInternal>

@property BOOL started;

@end
