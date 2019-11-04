## Creating some simple plots using ggplot2

In the following examples, I am using some data from the experiments included in this project: https://www.biorxiv.org/content/10.1101/473975v2

In the included .csv file here, each row contains data from a single trial. The column ‘expt’ specifies from which experiment the trial comes from,‘study1’ or ‘replicate’ In column ‘choice’: ‘1’ refers to ‘accepting a gamble/risk’; ‘0’ refers to ‘rejecting a gamble/risk’ The column ‘raw_rate’ contains the participant’s curiosity/desirability rating towards the stimulus presented in each trial. The column’win_prob’ shows the probability of winning presented on a wheel of fortune in each trial


### Barplot
The script (Markdown file in 'barplot' subfolder) were writen to share what I find useful from my experience when plotting a simple (bar)chart on data with more than two factors, using ggplot. The plot includes visualisation of error bars and raw data points. Note: there would be better and more advanced scripts out there if that’s what you are looking for.

The plot to be created shows the effect of different factors on individual’s acceptance/risk-taking rate
![alt text](barplot/barplot_trial2.jpeg)

### Modified Raincloud plot
A fun attempt to play with Raincloud Plots!
In the example here, I modified the original plot slightly by replacing the summary statistics (for each condition) represented by the boxplot (& whiskers) with geom_pointrange using means & standard errors (SE) values.
![alt text](raincloudplot_modified/raincloudplot_mytrial.jpeg)


Raincloud-plot is created by these guys: <br/>
Allen M, Poggiali D, Whitaker K et al. Raincloud plots: a multi-platform tool for robust data visualization [version 1; peer review: 2 approved]. Wellcome Open Res 2019, 4:63. DOI: 10.12688/wellcomeopenres.15191.1

Allen M, Poggiali D, Whitaker K, Marshall TR, Kievit R. (2018) RainCloudPlots tutorials and codebase (Version v1.1). Zenodo. http://doi.org/10.5281/zenodo.3368186

