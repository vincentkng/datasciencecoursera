
library(caret)
library(e1071)
library(randomForest)
library(UsingR)
library(shiny)

data(iris)

modelfit <- train(Species~., method="rf", data=iris)

shinyServer
(
  function(input, output, session) 
  {
    observe(
    {
      if(input$submit > 0)
        updateTabsetPanel(session, inputId="tabset", selected="p2")
    })

    predr <- reactive(
      predict(modelfit, newdata=data.frame(Sepal.Length=input$sepal.length, 
                                           Sepal.Width=input$sepal.width, 
                                           Petal.Length=input$petal.length, 
                                           Petal.Width=input$petal.width), type="prob")
    )
    
    output$img1<- renderImage(
    {
      if(input$submit == 0)
        return
      
      isolate({
        pred <- predr()
        
        if(max(pred[1,1],pred[1,2],pred[1,3]) == pred[1,1])
          output1_img <- "www/iris_setosa.png"
        else
          output1_img <- "www/iris_setosa_bw.png"
        
        return(
          list(
            src = output1_img, 
            contentType = "image/png",
            alt = "Face"
          )
        )
      }) #end isolate
    }, deleteFile = FALSE) 
    
    output$img2<- renderImage(
    {
      if(input$submit == 0)
        return
      
      isolate({
        pred <- predr()
        
        if(max(pred[1,1],pred[1,2],pred[1,3]) == pred[1,2])
          output2_img <- "www/iris_versicolor.png"
        else
          output2_img <- "www/iris_versicolor_bw.png"
        
        return(
          list( 
            src = output2_img,
            contentType = "image/png", 
            alt = "Face"
          )
        )
      }) #end isolate
    }, deleteFile = FALSE) 
    
    output$img3<- renderImage(
    {
      if(input$submit == 0)
        return
      
      isolate({
        pred <- predr()
        
        if(max(pred[1,1],pred[1,2],pred[1,3]) == pred[1,3])
          output3_img <- "www/iris_virginica.png"
        else
          output3_img <- "www/iris_virginica_bw.png"
        
        return(
          list( 
            src = output3_img,
            contentType = "image/jpg", 
            alt = "Face"
          )
        )
      }) #end isolate
    }, deleteFile = FALSE)
    
    output$prob <- renderText(
    {
      if(input$submit == 0)
        return
      
      isolate({
        pred <- predr()
        
        paste(
          names(pred)[1], "&nbsp;", pred[1,1], "<br>",
          names(pred)[2], "&nbsp;", pred[1,2], "<br>",
          names(pred)[3], "&nbsp;", pred[1,3], "<br>")
      }) #end isolate

    }) #end renderText
  } # end function
) #end shinyServer
