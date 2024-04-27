dashboardPage(
  skin='blue',
  dashboardHeader(title = 'Stock Dashboard', titleWidth = 230,
                  tags$li(a(href = 'https://www.linkedin.com/in/ibrahemalii/',
                            img(src = 'linkd.png',title = "linkedin link", height = "25px")),
                          class = "dropdown"),
                  tags$li(a(href = 'https://github.com/iibrahemali',
                            img(src = 'gh--logo.png',title = "github link", height = "25px")),
                          class = "dropdown")
              ),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Chart Builder", tabName = "chart", icon = icon("chart-line")),
      menuItem('Statistics', tabName='returns', icon = icon('coins')),
      menuItem("Data", tabName = "data", icon = icon("database")),
      textInput("symbol", label = "Enter a Ticker (yahoo.finance)", 
                placeholder = 'For example: AMZN'),
      actionButton('view', label = 'View'),
      tags$head(tags$script(src = "message-handler.js")),
      actionButton("do", "Intructions")
      )
    ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "chart",
              fluidRow(
                column(width = 12,
                       plotOutput(outputId = "chart")
                       ),
                column(width = 4,
                       dateRangeInput("date", label = h1('Date range'), start = '2018-01-01'),
                       actionButton('apply', 'Apply changes')
                       ),
                column(width = 4,
                       radioButtons("bb", label = h1("Bolindger Bands"),
                                    choices = list("No" = 'NULL', "Yes" = 'addBBands(n=20, sd=2.33)'), 
                                    selected = 'NULL')
                       ),
                column(width = 4, 
                       radioButtons('style', label=h1('Chart Style'),
                                    choices = list('Line' = 'line', 'Bars'= 'bars', 'Candlesticks'='candlesticks' ) ,
                                    selected = 'line'
                                    )
                       )
                )
              ),
      tabItem(tabName = "data",
              fluidRow(box(DT::dataTableOutput("table"), width = 12))
              ),
      tabItem(tabName = 'returns', 
              fluidRow(
                plotOutput(outputId = 'r_chart')
                ),
              fluidRow(
                plotOutput(outputId = 'r_ch')
                ),
              fluidRow(
                box(width=3, title='Avg return', background='black', solidHeader=TRUE, status='warning',
                    textOutput(outputId = 'mean')
                    ),
                box(width=3, title='Risk', background='black', solidHeader=TRUE, status='warning',
                    textOutput(outputId = 'sd')
                    ),
                box(width = 3, title='Skewness', background='black', solidHeader=TRUE, status='warning',
                    textOutput(outputId = 'skew')
                    ),
                box(width = 3, title='Kurtosis', background='black', solidHeader=TRUE, status='warning',
                    textOutput(outputId = 'kurt')
                    ),
                )
              )
      )
    )
  )
