//
//  QRSATestViewController.m
//  ExeProject
//
//  Created by qrh on 16/4/22.
//  Copyright © 2016年 com.mzmoney. All rights reserved.
//

#import "QRSATestViewController.h"
#import "RSAEncryptor.h"

@interface QRSATestViewController ()

@end

@implementation QRSATestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    //原始数据
    NSString *originalString = @"这是一段将要加密的字符串!";
    
    [self testfile1:originalString];
    NSLog(@"=========================================================");
    [self testfile2:originalString];
}

/**
 *  1.使用本机加密解密文件，进行加密和解密
 */
-(void)testfile1:(NSString *)inputStr{
    
    //使用.der和.p12中的公钥私钥加密解密
    NSString *public_key_path = [[NSBundle mainBundle] pathForResource:@"public_key.der" ofType:nil];
    NSString *private_key_path = [[NSBundle mainBundle] pathForResource:@"private_key.p12" ofType:nil];
    
    NSString *encryptStr = [RSAEncryptor encryptString:inputStr publicKeyWithContentsOfFile:public_key_path];
    NSString *decryptStr = [RSAEncryptor decryptString:encryptStr privateKeyWithContentsOfFile:private_key_path password:@"123456"];
    NSLog(@"加密前:%@", inputStr);
    NSLog(@"加密后:%@", encryptStr);
    NSLog(@"解密后:%@", decryptStr);
}
/**
 *  2.使用随机生成的RAS字符串，进行加密和解密，http://web.chacuo.net/netrsakeypair
 */
-(void)testfile2:(NSString *)inputStr{
    
    //使用.der和.p12中的公钥私钥加密解密
    NSString *public_key = @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDHGyaOlefXi5vggzbIRHgeDTpcjlCBSxpAliPvmvuAC0xc4Y0LYT0Xgx9rYCafwKGmwnj8UNN6CTz+YKZ/8zVd77MTyJfNIrFfSvoZJeIelGdY9Y+1j4MtjAAjHEf2QLIfOAAPZ7UbC0IUIOGDqBF5RiZPc43kS0NmoD3DVsCPJwIDAQAB";
    
    NSString *private_key = @"MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAMcbJo6V59eLm+CDNshEeB4NOlyOUIFLGkCWI++a+4ALTFzhjQthPReDH2tgJp/AoabCePxQ03oJPP5gpn/zNV3vsxPIl80isV9K+hkl4h6UZ1j1j7WPgy2MACMcR/ZAsh84AA9ntRsLQhQg4YOoEXlGJk9zjeRLQ2agPcNWwI8nAgMBAAECgYEAuN9o6bQfVXB4B/tN/p40uhKmQhKShbrqYVYHgA9zvuy+tu9nO03Kn+5MWjMpKeR/NIwWMpIKCqJRVBECCIQW48ImVU0+swvVhnLS40dzRy6puSNA1GhgYKzGgZa6qHo69OkySGO/dtgoRyZDcWdS8Ha3rgZlavuztsY13riRq8ECQQDuv5o8/h98LDr+UM3VvAjK75hILzLV5gdyKt5yhXrF1sEAoamDrxG1TZiTaB35Zuk4pr/7flRBDdFB0Y6rrUzpAkEA1X49CN2k7E1deoLeIALArlrCY7sLkB0I96AzU0xBETK1HSvf4hJ6YsxZ+HzQix/ribyXZya6hm/dP6z9DyoxjwJAXPjOJmxLdH6A5qIu1cmonuZYpduDb1ppkeLxxyUFn182v3k02uvk+HZkMRr9eS7DKWV+I4CZbM/lqjzh0ybkaQJBAJbR+Zg7zHjLJtCXhwgiKbCCmXUO/FowyNb2q4ubARR/OAeFqUHyP9dv+ddbhY/jWugQ/Px4FalHeYu0T4nZCu0CQQCzbBANdUv+ysRkIGKSLbow5EuTYoTRbcQ4GwdEqbeuBHro4SPnSXntKJTsrLnT+TvQpKsoSjpvpnzaQz+0RN9r";
    
    NSString *encryptStr = [RSAEncryptor encryptString:inputStr publicKey:public_key];
    NSString *decryptStr = [RSAEncryptor decryptString:encryptStr privateKey:private_key];
    NSLog(@"加密前:%@", inputStr);
    NSLog(@"加密后:%@", encryptStr);
    NSLog(@"解密后:%@", decryptStr);
}

@end
