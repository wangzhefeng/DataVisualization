import numpy as np
import pandas as pd
import seaborn as sns


def scatter_matrix(df, cagegorical = None):
    """
    # 散点图矩阵
    """
    if cagegorical:
        sns.pairplot(df, hue = cagegorical, size = 2.5)
    else:
        sns.pairplot(df, size = 2.5)
    
def histogram_plot(df, row, col, categorical, imgpath = None)
    """
    分面直方图
    """
    gird = sns.FacetGrid(df, row, col, margin_titles = True)
    grid.map(plt.hist, categorical, bins = np.linspace(0, 40, 15))

    
