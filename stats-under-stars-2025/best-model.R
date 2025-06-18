train   <- read.csv("train.csv",  header = TRUE, sep = " ",
                    quote = "\"", stringsAsFactors = FALSE,
                    check.names = FALSE)

dataset <- read.csv("test.csv",   header = TRUE, sep = " ",
                    quote = "\"", stringsAsFactors = FALSE,
                    check.names = FALSE)

add_engineered_vars <- function(df) {

  df$same_account <- df$`From Account` == df$`To Account`
  
  key <- paste(df$`From Account`, df$`To Account`, sep = "_")
  df$repeated <- ave(key, key, FUN = length) > 1
  
  df
}

train   <- add_engineered_vars(train)
dataset <- add_engineered_vars(dataset)

Data <- train[, -c(2, 3)]

glm_rep_small <- glm(
  `Is Laundering` ~ repeated +
    `Avg Stock Account To` + `Avg Stock Account From` +
    `Type Account To`,
  family = binomial(link = "probit"),
  data   = Data
)
summary(glm_rep_small)

plot(table(dataset$same_account, dataset$repeated),
     main = "Same-account vs repeated transactions")

prob_fraud <- predict(glm_rep_small, newdata = dataset, type = "response")
prediction <- ifelse(prob_fraud > 0.5, 1, 0)

submission <- data.frame(prob_fraud, prediction)
write.table(
  submission,
  file      = "submission.txt",
  sep       = " ",
  row.names = FALSE,
  col.names = FALSE,
  quote     = FALSE
)
