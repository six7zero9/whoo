setwd("/Users/efridge123/Dropbox/MTG/TCGspiders/rtr")

filenames<-list.files(pattern =".csv")

for( i in 1:length( filenames ) ){
    
    ##transfer timestamp from filename to table /broken
    x <- sub(pattern = "rtr.csv", replacement = "2014", filenames[i], ignore.case = TRUE, perl = FALSE)
    x1 <- gsub(pattern = "_", replacement = "-", x, ignore.case = TRUE, perl = FALSE)
    
    df<-read.csv(file = filenames[i], header = TRUE, sep = ",", colClasses="character")
    
        df$rarity <- NULL ##discards anomalous rarity column
    
    ##create 5 vendor columns
    df[, 7:11] <- colsplit(df$vendors, pattern=",", c("Vendor 1", "Vendor 2", "Vendor 3", "Vendor 4", "Vendor 5"))
    
    ##create 5 condition columns
    df[, 12:16] <- colsplit(df$condition, pattern=",", c("Condition 1", "Condition 2", "Condition 3", "Condition 4", "Condition 5"))
    
    ##create 5 price columns
    df$price <- str_replace_all(string=df$price, pattern="\\$", replacement="")
    df[, 17:21] <- colsplit(df$price, pattern=",", c("Price 1", "Price 2", "Price 3", "Price 4", "Price 5"))    
    
    ##create 5 shipping columns
    df$shipping <- str_replace_all(string=df$shipping, pattern="\\$", replacement="")
    df$shipping <- str_replace_all(string=df$shipping, pattern="Shipping:", replacement="")
    df[, 22:26] <- colsplit(df$shipping, pattern=",", c("Shipping 1", "Shipping 2", "Shipping 3", "Shipping 4", "Shipping 5"))
    
    ##create 5 quantity columns
    df[, 27:31] <- colsplit(df$quantity, pattern=",", c("Quantity 1", "Quantity 2", "Quantity 3", "Quantity 4", "Quantity 5"))
    
    ##take away old columns
    df$shipping <- NULL
    df$quantity <- NULL
    df$price <- NULL
    df$vendors <- NULL
    df$condition <- NULL
    
    ##create 5 new tables from df
    df1 <- subset(df, select=c("cardname", "Vendor 1", "Condition 1", "Price 1", "Shipping 1", "Quantity 1"))
        df1 <- rename(df1, c("Vendor 1"="vendor", "Condition 1"="condition", "Price 1"="price", "Shipping 1"="shipping", "Quantity 1"="quantity"))
    df2 <- subset(df, select=c("cardname", "Vendor 2", "Condition 2", "Price 2", "Shipping 2", "Quantity 2"))
        df2 <- rename(df2, c("Vendor 2"="vendor", "Condition 2"="condition", "Price 2"="price", "Shipping 2"="shipping", "Quantity 2"="quantity"))
    df3 <- subset(df, select=c("cardname", "Vendor 3", "Condition 3", "Price 3", "Shipping 3", "Quantity 3"))
        df3 <- rename(df3, c("Vendor 3"="vendor", "Condition 3"="condition", "Price 3"="price", "Shipping 3"="shipping", "Quantity 3"="quantity"))
    df4 <- subset(df, select=c("cardname", "Vendor 4", "Condition 4", "Price 4", "Shipping 4", "Quantity 4"))
        df4 <- rename(df4, c("Vendor 4"="vendor", "Condition 4"="condition", "Price 4"="price", "Shipping 4"="shipping", "Quantity 4"="quantity"))
    df5 <- subset(df, select=c("cardname", "Vendor 5", "Condition 5", "Price 5", "Shipping 5", "Quantity 5"))
        df5 <- rename(df5, c("Vendor 5"="vendor", "Condition 5"="condition", "Price 5"="price", "Shipping 5"="shipping", "Quantity 5"="quantity"))
    
    ##rbind dataframes to form standard table
    df <- rbind(df1, df2, df3, df4, df5)

    ##add date column with date from index
    df[,"Date"] <-as.Date(x1, "%m-%d-%Y")
    
    ##change dir for SQL staging
    setwd("/Users/efridge123/Dropbox/MTG/SQL staging")
    
    ##rewrite indexed file with correct format
    write.csv(df, filenames[[i]], row.names = FALSE, na="0" )
    
    ##change dir back to TCGspider
    setwd("/Users/efridge123/Dropbox/MTG/TCGspiders/rtr")
}