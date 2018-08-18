package main

import (
	pb "gitee.com/fanlv/GRPCServer/proto"
	"golang.org/x/net/context"
)

type server struct{}

func (s *server) Login(ctx context.Context, in *pb.LoginRequest) (*pb.LoginResponse, error) {
	var resp *pb.LoginResponse
	if in.Username =="fanlv" && in.Password == "123456" {
		resp = &pb.LoginResponse{
			User:&pb.User{
				Uid:"001",
				Name:"fanlv",
				Logo:"https://www.jianshu.com/u/5693155e7b39",
			},
			BaseResp:&pb.BaseResponse{
				Code:0,
				Msg:"ok",
			},
		}
	}else {
		resp = &pb.LoginResponse{
			User:nil,
			BaseResp:&pb.BaseResponse{
				Code:1,
				Msg:"login fail",
			},
		}
	}
	return resp,nil
}

