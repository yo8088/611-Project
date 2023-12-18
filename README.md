This dataset examines data from 995 largest YouTube channels (by
subscriber count) and contains values for a variety of variables, such as
a channel's number of uploads or its country of origin. In this project, I
attempt to perform analyses which examine the factors which impact the
success of a channel.

To build the docker container for this project, run the following code:

`docker build -t 611-project .`

Then, to start an RStudio server, run the following code:

`docker run -p 8787:8787 611-project`

You will be granted a password (shown in red letters). Go to localhost:8787
on your browser and enter 'rstudio' and the provided password when prompted.

To build the figures and report in my project, first run 

`make clean`

to clear away everything except for the source code. Then run 

`make all`

to generate the associated figures and report. If the report fails to be
generated (an issue I encountered), you can open the Report.Rmd markdown
file and knit the markdown file into a pdf.