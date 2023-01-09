import pandas as pd

def model(dbt, session):

    # Random data
    final_df = pd.DataFrame({
        'id': [1, 2, 3, 4, 5],
        'name': ['a', 'b', 'c', 'd', 'e'],
        'value': [1, 2, 3, 4, 5]
    })

    return final_df
