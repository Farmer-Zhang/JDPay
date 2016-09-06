//
//  ViewController.m
//  FormCommit
//
//  Created by Svendson on 15/12/1.
//  Copyright © 2015年 hongdukechuang. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    {"message":"操作成功","result":0,"data":{"successCallbackUrl":"HxddZVxAHG2DeTZfMST3GmerxglJNy+Q\n","tradeDescription":"aa44Xr2EEfE=\n","tradeTime":"3bl8QEKH6afZeFKn1lZ5ZARiP2UNCR1H\n","tradeNum":"yecIYP0VJ7MBMpzymRPxXGQD92SvhNRT\n","tradeName":"aa44Xr2EEfE=\n","merchantRemark":"WX05sSwTBWI=\n","version":"2.0","currency":"CNZy6ZeI++8=\n","merchantSign":"O8nlhzE6t96mUSU6y3CbKyRKKeRzi3w60d8JqHHNANH6i/Xi41+/0DTXr2sbWinlVp7830tJxHNE\r\nQO24UC3IEVE0n3Wzipj4yOkpV0h8EzXpkyZsPKTzrAZ3RvxAw0TQfU3jywRGkSUrAb+OeePLCnXu\r\nJOa9PFIcjgCv0IVIOYY=\r\n","token":"","tradeAmount":"ZAP3ZK+E1FM=\n","notifyUrl":"HxddZVxAHG1VAonjwnPMzQ/UCs+SPSiAGLyN+0ia6GlhC7W48419jpOOVT1+DaeY5+9CeyK4plE=\n","merchantNum":"110100400001","failCallbackUrl":"HxddZVxAHG035DOo9mOF0LP3PBmxJ2/N\n"},"jdReqUrl":"https://m.jdpay.com/wepay/web/pay"}
    
    
    NSMutableDictionary *formDic = [[NSMutableDictionary alloc] init];
    [formDic setObject:@"HxddZVxAHG2DeTZfMST3GmerxglJNy+Q\n" forKey:@"successCallbackUrl"];
    [formDic setObject:@"aa44Xr2EEfE=\n" forKey:@"tradeDescription"];
    [formDic setObject:@"3bl8QEKH6afZeFKn1lZ5ZARiP2UNCR1H\n" forKey:@"tradeTime"];
    [formDic setObject:@"yecIYP0VJ7MBMpzymRPxXGQD92SvhNRT\n" forKey:@"tradeNum"];
    [formDic setObject:@"aa44Xr2EEfE=\n" forKey:@"tradeName"];
    [formDic setObject:@"WX05sSwTBWI=\n" forKey:@"merchantRemark"];
    [formDic setObject:@"2.0" forKey:@"version"];
    [formDic setObject:@"CNZy6ZeI++8=\n" forKey:@"currency"];
    [formDic setObject:@"O8nlhzE6t96mUSU6y3CbKyRKKeRzi3w60d8JqHHNANH6i/Xi41+/0DTXr2sbWinlVp7830tJxHNE\r\nQO24UC3IEVE0n3Wzipj4yOkpV0h8EzXpkyZsPKTzrAZ3RvxAw0TQfU3jywRGkSUrAb+OeePLCnXu\r\nJOa9PFIcjgCv0IVIOYY=\r\n" forKey:@"merchantSign"];
    [formDic setObject:@"" forKey:@"token"];
    [formDic setObject:@"ZAP3ZK+E1FM=\n" forKey:@"tradeAmount"];
    [formDic setObject:@"HxddZVxAHG1VAonjwnPMzQ/UCs+SPSiAGLyN+0ia6GlhC7W48419jpOOVT1+DaeY5+9CeyK4plE=\n" forKey:@"notifyUrl"];
    [formDic setObject:@"110100400001" forKey:@"merchantNum"];
    [formDic setObject:@"HxddZVxAHG035DOo9mOF0LP3PBmxJ2/N\n" forKey:@"failCallbackUrl"];
    
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/html",@"text/javascript",nil];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manager POST:@"https://m.jdpay.com/wepay/web/pay" parameters:formDic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *htmlstring=[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        //将第二次请求出来的html字符串加载到webview
        [self.webView loadHTMLString:htmlstring baseURL:[NSURL URLWithString:@"https://m.jdpay.com/wepay/web/pay"]];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }
     ];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    
    NSLog(@"=============%@",webView.request.URL);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.webView resignFirstResponder];
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {

    NSLog(@"=============%@",request.URL);
    

    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
