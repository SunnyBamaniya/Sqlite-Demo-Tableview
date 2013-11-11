static NSString *dbPath;
static NSString *databaseName=@"Crickter.sqlite";


+(void)check_Create_DB
{
    NSArray *docPaths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	NSString *docDir=[docPaths objectAtIndex:0];
	dbPath =[docDir stringByAppendingPathComponent:databaseName];
    NSLog(@"DB %@",dbPath);
    
	
	BOOL success;
    
    
	NSFileManager *fm=[NSFileManager defaultManager];
	success=[fm fileExistsAtPath:dbPath];
    if(success)
    {
        return;
    }
    NSString *dbPathFromApp=[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:databaseName];
    //NSString *filePathFromApp=[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:fileName];
    //[fm1 copyItemAtPath:filePathFromApp toPath:filePath1 error:nil];
    [fm copyItemAtPath:dbPathFromApp toPath:dbPath error:nil];
	////NSLog(@"Database File Created...");
}

+(NSMutableArray*)Selectplayer
{
    
    sqlite3 *database;
	NSMutableArray *dic=[[NSMutableArray alloc] init];
	NSString *ID, *playername, *teamname;
	if(sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK) {
		NSString *sqlTmp=[NSString stringWithFormat:@"Select id,playername,teamname from team "];
        NSLog(@"sqlTmp : %@", sqlTmp);
		const char *sqlStmt=[sqlTmp UTF8String];
		sqlite3_stmt *cmp_sqlStmt;
		if(sqlite3_prepare_v2(database, sqlStmt, -1, &cmp_sqlStmt, NULL)==SQLITE_OK) {
            
            
			while(sqlite3_step(cmp_sqlStmt)==SQLITE_ROW) {
                
				//Quizid=(int)sqlite3_column_int(cmp_sqlStmt, 0);
                if (sqlite3_column_text(cmp_sqlStmt, 0) != nil)
                    ID = [NSString stringWithUTF8String:(char *)sqlite3_column_text(cmp_sqlStmt, 0)];
                else
                    ID = @"";
                
                
                
                if (sqlite3_column_text(cmp_sqlStmt, 1) != nil)
                    playername = [NSString stringWithUTF8String:(char *)sqlite3_column_text(cmp_sqlStmt, 1)];
                else
                    playername = @"";
                
                
                if (sqlite3_column_text(cmp_sqlStmt, 2) != nil)
                    teamname = [NSString stringWithUTF8String:(char *)sqlite3_column_text(cmp_sqlStmt, 2)];
                else
                    teamname = @"";
                
                //
                NSMutableDictionary *dicObj=[[NSMutableDictionary alloc] init];
                [dicObj setObject:[NSString stringWithFormat:@"%@",ID ]forKey:@"id"];
                [dicObj setObject:[NSString stringWithFormat:@"%@",playername] forKey:@"playername"];
				[dicObj setObject:[NSString stringWithFormat:@"%@",teamname] forKey:@"teamname"];
				
				[dic addObject: dicObj];
                
			}
		}
		sqlite3_finalize(cmp_sqlStmt);
	}
	sqlite3_close(database);
	return dic;
    
	
}
+(BOOL)updateCategory:(NSString *)id playername:(NSString*)playername teamname:(NSString*)teamname  {
    sqlite3 *database;
    //	NSMutableArray *dic=[[NSMutableArray alloc] init];
    //    NSString *Cid;
    NSString *ID;
	if(sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK) {
		NSString *sqlTmp=[NSString stringWithFormat:@"update team set playername ='%@' ,teamname = '%@' where id = '%@'",playername,teamname,id];
		const char *sqlStmt=[sqlTmp UTF8String];
		sqlite3_stmt *cmp_sqlStmt;
        ////NSLog(@"Update string is : %@", sqlTmp);
		if(sqlite3_prepare_v2(database, sqlStmt, -1, &cmp_sqlStmt, NULL)==SQLITE_OK) {
            
			while(sqlite3_step(cmp_sqlStmt)==SQLITE_ROW) {
                //				Cid=[NSString stringWithUTF8String:(char *)sqlite3_column_text(cmp_sqlStmt, 1)];
                //				NSMutableDictionary *dicObj=[[NSMutableDictionary alloc] init];
                //				[dic addObject: dicObj];
                //                [dicObj release];
                
                playername=[NSString stringWithUTF8String:(char *)sqlite3_column_text(cmp_sqlStmt, 1)];
                teamname=[NSString stringWithUTF8String:(char *)sqlite3_column_text(cmp_sqlStmt, 2)];
                
                
                
                NSMutableDictionary *dicObj=[[NSMutableDictionary alloc] init];
                [dicObj setObject:[NSString stringWithFormat:@"%@",id ]forKey:@"id"];
                [dicObj setObject:[NSString stringWithFormat:@"%@",playername] forKey:@"playername"];
				[dicObj setObject:[NSString stringWithFormat:@"%@",teamname] forKey:@"teamname"];
			}
		}
		sqlite3_finalize(cmp_sqlStmt);
        sqlite3_close(database);
        //        [dic release];
        return TRUE;
	}
    else
    {
        return FALSE;
    }
}

+(BOOL)Insert:(NSString *)playername teamname:(NSString *)teamname
{
    sqlite3 *database;
	NSMutableArray *dic=[[NSMutableArray alloc] init];
    //NSString *UName;
	if(sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK) {
		NSString *sqlTmp=[NSString stringWithFormat: @"insert into team (playername,teamname)  values (\"%@\" ,\"%@\")",playername,teamname];
		const char *sqlStmt=[sqlTmp UTF8String];
		//sqlite3_stmt *cmp_sqlStmt;
        sqlite3_stmt *cmp_sqlStmt;
        ////NSLog(@"Insert string is : %@", sqlTmp);
		if(sqlite3_prepare_v2(database, sqlStmt, -1, &cmp_sqlStmt, NULL)==SQLITE_OK) {
            
            //            sqlite3_bind_text(cmp_sqlStmt, 1, [playername UTF8String], -1, SQLITE_TRANSIENT);
            
			while(sqlite3_step(cmp_sqlStmt)==SQLITE_ROW) {
                
				//Quizid=(int)sqlite3_column_int(cmp_sqlStmt, 0);
                //				UName=[NSString stringWithUTF8String:(char *)sqlite3_column_text(cmp_sqlStmt, 1)];
				//Ansb=[NSString stringWithUTF8String:(char *)sqlite3_column_text(cmp_sqlStmt, 3)];
				//Ansc=[NSString stringWithUTF8String:(char *)sqlite3_column_text(cmp_sqlStmt, 4)];
				//Ansd=[NSString stringWithUTF8String:(char *)sqlite3_column_text(cmp_sqlStmt, 5)];
				//Answer=[NSString stringWithUTF8String:(char *)sqlite3_column_text(cmp_sqlStmt, 6)];
				
				NSMutableDictionary *dicObj=[[NSMutableDictionary alloc] init];
                //
                //
				
				[dic addObject: dicObj];
                
			}
		}
		sqlite3_finalize(cmp_sqlStmt);
        sqlite3_close(database);
        
        return TRUE;
	}
    else
    {
        return FALSE;
    }
}
+(BOOL)DeleteUser:(NSString*)id
{
    sqlite3 *database;
    NSMutableArray *dic=[[NSMutableArray alloc] init];
    
	if(sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK) {
        NSString *SQLstmt = [NSString stringWithFormat: @"DELETE FROM team where id = %@",id];
        
        //NSLog(@"delete = %@", SQLstmt );
		const char *sqlStmt=[SQLstmt UTF8String];
		sqlite3_stmt *cmp_sqlStmt;
		if(sqlite3_prepare_v2(database, sqlStmt, -1, &cmp_sqlStmt, NULL)==SQLITE_OK) {
            
			while(sqlite3_step(cmp_sqlStmt)==SQLITE_ROW) {
                //NSLog(@"SQL QUERY = %@",SQLstmt);
                //                id=[[NSString stringWithUTF8String:(char *)sqlite3_column_text(cmp_sqlStmt, 0)];
                
                NSMutableDictionary *dicObj=[[NSMutableDictionary alloc] init];
                
                [dicObj setValue:[NSString stringWithFormat:@"%@",id] forKey:@"id"];
                
                
                [dic addObject: dicObj];
                
			}
		}
		sqlite3_finalize(cmp_sqlStmt);
	}
	sqlite3_close(database);
    
    return TRUE;
}

