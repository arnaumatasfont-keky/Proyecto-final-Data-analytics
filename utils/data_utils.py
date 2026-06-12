import pandas as pd

def dataset_overview(datasets: dict, n_rows: int = 5):

    for name, df in datasets.items():

        print("\n" + "=" * 80)
        print(f"DATASET: {name}")
        print("=" * 80)

        print(f"\nShape: {df.shape}")

        print("\nInfo:")
        df.info()

        print("\nMissing values:")
        missing = df.isnull().sum()
        missing_pct = (missing / len(df) * 100).round(2)

        missing_df = pd.DataFrame({
            "Missing Values": missing,
            "Percentage (%)": missing_pct
        })

        print(missing_df[missing_df["Missing Values"] > 0])

        print(f"\nDuplicate rows: {df.duplicated().sum()}")

        print(f"\nHead ({n_rows} rows):")
        print(df.head(n_rows))

        print("\n")


def convert_columns_to_datetime(df, date_columns):
   
    df = df.copy()

    for col in date_columns:
        if col in df.columns:
            df[col] = pd.to_datetime(df[col], errors="coerce")
        else:
            print(f"Warning: column '{col}' not found in DataFrame.")

    return df