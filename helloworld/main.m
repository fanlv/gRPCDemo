/*
 *
 * Copyright 2015 gRPC authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#import <GRPCClient/GRPCCall+ChannelArg.h>
#import <GRPCClient/GRPCCall+Tests.h>
#import <HelloWorld/Helloworld.pbrpc.h>
#import <HelloWorld/User.pbrpc.h>

static NSString * const kHostAddress = @"127.0.0.1:50051";

int main(int argc, char * argv[]) {
  @autoreleasepool {
    [GRPCCall useInsecureConnectionsForHost:kHostAddress];
    [GRPCCall setUserAgentPrefix:@"HelloWorld/1.0" forHost:kHostAddress];

      Greeter *userClient = [[Greeter alloc] initWithHost:kHostAddress];
      LoginRequest *req = [[LoginRequest alloc] init];
      req.username = @"fanlv";
      req.password = @"123456";

      [userClient loginWithRequest:req handler:^(LoginResponse * _Nullable response, NSError * _Nullable error) {
          if (!error) {
              if (response.baseResp.code == 0) {
                  NSLog(@"收到服务器段数据返回 ： %@",response.user.name);
              }else{
                  NSLog(@"error :%@",response.baseResp.msg);
              }
          }else{
              NSLog(@"%@",error);
          }
      }];



//    HLWGreeter *client = [[HLWGreeter alloc] initWithHost:kHostAddress];
//
//    HLWHelloRequest *request = [HLWHelloRequest message];
//    request.name = @"Objective-C";
//
//    [client sayHelloWithRequest:request handler:^(HLWHelloReply *response, NSError *error) {
//      NSLog(@"%@", response.message);
//    }];

    return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
  }
}
