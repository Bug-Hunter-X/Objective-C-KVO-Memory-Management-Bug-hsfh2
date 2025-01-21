The solution involves removing the observer in the observer's dealloc method:

```objectivec
@interface MyObserver : NSObject
@property (nonatomic, strong) NSString *observedString;
@end

@implementation MyObserver
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@