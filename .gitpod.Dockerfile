FROM gitpod/workspace-full
# FROM jupyter/datascience-notebook

# USER gitpod

RUN pip install snowflake-snowpark-python[pandas] snowflake-connector-python snowflake-snowpark-python streamlit jupyter scikit-learn numpy lightgbm xgboost scipy seaborn matplotlib cloudpickle cachetools imbalanced-learn optuna venv notebook

# WORKDIR /snow/tmp

ENV SNOWSQL_LOGIN_SHELL=/home/gitpod/.profile
ENV SNOWSQL_DEST=/bin

RUN { mkdir -p ~/utils/snowsql ; cd ~/utils/snowsql ; curl -LJOf https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap/1.2/linux_x86_64/snowsql-1.2.22-linux_x86_64.bash ; \
      chmod +x ~/utils/snowsql/snowsql-1.2.22-linux_x86_64.bash ; \
      # sudo ~/utils/snowsql/snowsql-1.2.22-linux_x86_64.bash ; \
}

# USER root
