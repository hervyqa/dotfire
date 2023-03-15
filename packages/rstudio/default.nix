{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      # failed to compiling:
      # arrow, Hmisc (interp), ggforce, prophet, torch
      (
        rstudioWrapper.override {
          packages = with rPackages; [
            Cairo
            DT
            DataExplorer
            JuliaCall
            JuliaConnectoR
            MASS
            RANN
            RColorBrewer
            Rcpp
            XML
            baseline
            beepr
            blogdown
            bookdown
            bookdownplus
            caret
            colourpicker
            dataCompareR
            data_table
            datapasta
            devtools
            diffobj
            dplyr
            duckdb
            dygraphs
            echarts4r
            esquisse
            flexdashboard
            forecast
            foreign
            freqparcoord
            fst
            geofacet
            ggiraph
            ggplot2
            glue
            gmodels
            gridExtra
            gym
            here
            httr
            installr
            janitor
            jsonlite
            knitr
            languageserver
            languageserversetup
            leaflet
            listviewer
            lme4
            lubridate
            magrittr
            mapsapi
            officer
            openNLP
            openxlsx
            optparse
            pacman
            paletteer
            patchwork
            plotly
            plumber
            profvis
            purrr
            quantmod
            quarto
            r5r
            reactable
            readr
            readxl
            remedy
            remotes
            reshape2
            reticulate
            rio
            rmarkdown
            roxygen2
            rvest
            scales
            sf
            shiny
            shinyjs
            spatstat
            splitstackshape
            sqldf
            stringr
            tensorflow
            testthat
            tidycensus
            tidygeocoder
            tidymodels
            tidyquant
            tidyr
            tidytext
            tidyverse
            tidyxl
            tmap
            tmaptools
            tsbox
            usethis
            validate
            vetiver
            vioplot
            vroom
            xts
            yaml
            ymlthis
            zoo
          ];
        }
      )
    ];
  };
}
