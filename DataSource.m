#import "DataSource.h"
#import "StockEntity.h"
#import "ProductEntity.h"
#import "WarehouseEntity.h"
#import "StoreEntity.h"


@implementation DataSource

+ (void)getStocks:(void (^)(NSArray *))completion {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableArray *array = [NSMutableArray array];

        for (int i = 0; i < 100; ++i) {
            StockEntity *stockEntity = [[StockEntity alloc] init];
            stockEntity.id = i + 1;
            stockEntity.locationType = [DataSource randomNumberBetween:1 maxNumber:2];
            stockEntity.locationId = [DataSource randomNumberBetween:1 maxNumber:100];
            stockEntity.productId = [DataSource randomNumberBetween:1 maxNumber:100];
            stockEntity.quantity = [DataSource randomNumberBetween:1 maxNumber:1000];
            [array addObject:stockEntity];
        }

        sleep([DataSource randomNumberBetween:0 maxNumber:5]);
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(array);
        });
    });
}

+ (void)getAllProducts:(void (^)(NSDictionary *))completion {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];

        for (int i = 0; i < 100; ++i) {
            ProductEntity *productEntity = [[ProductEntity alloc] init];
            productEntity.id = i + 1;
            productEntity.productNumber = [DataSource productNumberLoremIpsum];
            productEntity.productDescription = [DataSource productDescriptionLoremIpsum];
            [dict setObject:productEntity forKey:[NSString stringWithFormat:@"%d", productEntity.id]];
        }
        
        sleep([DataSource randomNumberBetween:0 maxNumber:5]);
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(dict);
        });
    });
}

+ (void)getAllWarehouses:(void (^)(NSArray *))completion {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableArray *array = [NSMutableArray array];

        for (int i = 0; i < 100; ++i) {
            WarehouseEntity *warehouseEntity = [[WarehouseEntity alloc] init];
            warehouseEntity.id = i + 1;
            warehouseEntity.name = [NSString stringWithFormat:@"Warehouse %d", warehouseEntity.id];
            [array addObject:warehouseEntity];
        }

        sleep([DataSource randomNumberBetween:0 maxNumber:5]);
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(array);
        });
    });
}

+ (void)getAllStores:(void (^)(NSDictionary *))completion {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];

        for (int i = 0; i < 100; ++i) {
            StoreEntity *storeEntity = [[StoreEntity alloc] init];
            storeEntity.id = i + 1;
            storeEntity.name = [NSString stringWithFormat:@"Store %d", storeEntity.id];
            [dict setObject:storeEntity forKey:[NSString stringWithFormat:@"%d", storeEntity.id]];
        }

        sleep([DataSource randomNumberBetween:0 maxNumber:5]);
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(dict);
        });
    });
}

#pragma mark - Helpers

+ (NSInteger)randomNumberBetween:(NSInteger)min maxNumber:(NSInteger)max {
    return min + arc4random_uniform(max - min + 1);
}

+ (NSString *)productNumberLoremIpsum {
    NSString *lorem = @"Sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur";
    lorem = [lorem substringToIndex:[DataSource randomNumberBetween:10 maxNumber:100]];
    return [NSString stringWithFormat:@"%@%@%@", @"Product # Start[", lorem, @"]End"];
}

+ (NSString *)productDescriptionLoremIpsum {
    NSString *lorem = @"Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat";
    lorem = [lorem substringToIndex:[DataSource randomNumberBetween:10 maxNumber:400]];
    return [NSString stringWithFormat:@"%@%@%@", @"Description Start[", lorem, @"]End"];
}

@end