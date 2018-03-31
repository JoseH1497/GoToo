//
//  DBManager.h
//  GoToo
//
//  Created by Jose Herrera on 3/31/18.
//  Copyright © 2018 Jose Herrera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>


@interface DBManager : NSObject




@property (nonatomic, strong) NSMutableArray *arrColumnNames;//keep track of all columns in table

@property (nonatomic) int affectedRows; //number of rows affected when a query runs

@property (nonatomic) long long lastInsertedRowID; //keep track of primary key



//initialize database and specify fileName
-(instancetype)initWithDatabaseFileName: (NSString *) dbFileName;
//
-(NSArray *)loadDataFromDB:(NSString *)query; //run SELECT queries and load data

-(void)executeQuery:(NSString *)query;//execute insert, update and delete queries

@end
