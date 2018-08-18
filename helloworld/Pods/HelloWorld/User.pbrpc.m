#if !defined(GPB_GRPC_PROTOCOL_ONLY) || !GPB_GRPC_PROTOCOL_ONLY
#import "User.pbrpc.h"
#import "User.pbobjc.h"
#import <ProtoRPC/ProtoRPC.h>
#import <RxLibrary/GRXWriter+Immediate.h>


@implementation Greeter

// Designated initializer
- (instancetype)initWithHost:(NSString *)host {
  self = [super initWithHost:host
                 packageName:@"user"
                 serviceName:@"Greeter"];
  return self;
}

// Override superclass initializer to disallow different package and service names.
- (instancetype)initWithHost:(NSString *)host
                 packageName:(NSString *)packageName
                 serviceName:(NSString *)serviceName {
  return [self initWithHost:host];
}

#pragma mark - Class Methods

+ (instancetype)serviceWithHost:(NSString *)host {
  return [[self alloc] initWithHost:host];
}

#pragma mark - Method Implementations

#pragma mark Login(LoginRequest) returns (LoginResponse)

/**
 * Sends a greeting
 */
- (void)loginWithRequest:(LoginRequest *)request handler:(void(^)(LoginResponse *_Nullable response, NSError *_Nullable error))handler{
  [[self RPCToLoginWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
/**
 * Sends a greeting
 */
- (GRPCProtoCall *)RPCToLoginWithRequest:(LoginRequest *)request handler:(void(^)(LoginResponse *_Nullable response, NSError *_Nullable error))handler{
  return [self RPCToMethod:@"Login"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[LoginResponse class]
        responsesWriteable:[GRXWriteable writeableWithSingleHandler:handler]];
}
@end
#endif
