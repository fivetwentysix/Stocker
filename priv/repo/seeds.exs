# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     StockScreener.Repo.insert!(%StockScreener.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias StockScreener.Symbols
alias StockScreener.Symbols.Symbol
alias StockScreener.Quotes
alias StockScreener.Quotes.Quote

require Logger

symbols = [
  "ABT",
  "ABBV",
  "ACN",
  "ADBE",
  "ADT",
  "AAP",
  "AES",
  "AFL",
  "AMG",
  "A",
  "APD",
  "AKAM",
  "AA",
  "AGN",
  "ALXN",
  "ALLE",
  "ADS",
  "ALL",
  "ALTR",
  "MO",
  "AMZN",
  "AEE",
  "AAL",
  "AEP",
  "AXP",
  "AIG",
  "AMT",
  "AMP",
  "ABC",
  "AME",
  "AMGN",
  "APH",
  "ADI",
  "AON",
  "APA",
  "AIV",
  "AMAT",
  "ADM",
  "AIZ",
  "T",
  "ADSK",
  "ADP",
  "AN",
  "AZO",
  "AVGO",
  "AVB",
  "AVY",
  "BLL",
  "BAC",
  "BK",
  "BAX",
  "BBT",
  "BDX",
  "BBBY",
  "BRK-B",
  "BBY",
  "BLX",
  "HRB",
  "BA",
  "BWA",
  "BXP",
  "BMY",
  "BF-B",
  "CHRW",
  "COG",
  "CPB",
  "COF",
  "CAH",
  "HSIC",
  "KMX",
  "CCL",
  "CAT",
  "CBS",
  "CNP",
  "CTL",
  "CERN",
  "CF",
  "SCHW",
  "CHK",
  "CVX",
  "CMG",
  "CB",
  "CI",
  "XEC",
  "CINF",
  "CTAS",
  "CSCO",
  "C",
  "CTXS",
  "CLX",
  "CME",
  "CMS",
  "KO",
  "CTSH",
  "CL",
  "CMCSA",
  "CMA",
  "CAG",
  "COP",
  "CNX",
  "ED",
  "STZ",
  "GLW",
  "COST",
  "CCI",
  "CSX",
  "CMI",
  "CVS",
  "DHI",
  "DHR",
  "DRI",
  "DVA",
  "DE",
  "DLPH",
  "DAL",
  "XRAY",
  "DVN",
  "DO",
  "DFS",
  "DISCA",
  "DISCK",
  "DG",
  "DLTR",
  "D",
  "DOV",
  "DOW",
  "DTE",
  "DD",
  "DUK",
  "ETFC",
  "EMN",
  "ETN",
  "EBAY",
  "ECL",
  "EIX",
  "EW",
  "EA",
  "EMR",
  "ENDP",
  "ETR",
  "EOG",
  "EQT",
  "EFX",
  "EQIX",
  "EQR",
  "ESS",
  "EL",
  "ES",
  "EXC",
  "EXPE",
  "EXPD",
  "XOM",
  "FFIV",
  "FB",
  "FAST",
  "FDX",
  "FIS",
  "FITB",
  "FSLR",
  "FE",
  "FLIR",
  "FLS",
  "FLR",
  "FMC",
  "FTI",
  "F",
  "FOSL",
  "BEN",
  "FCX",
  "FTR",
  "GME",
  "GPS",
  "GRMN",
  "GD",
  "GE",
  "GIS",
  "GM",
  "GPC",
  "GNW",
  "GILD",
  "GS",
  "GT",
  "GOOGL",
  "GOOG",
  "GWW",
  "HAL",
  "HBI",
  "HOG",
  "HIG",
  "HAS",
  "HCA",
  "HP",
  "HES",
  "HPQ",
  "HD",
  "HON",
  "HRL",
  "HST",
  "HUM",
  "HBAN",
  "ITW",
  "IR",
  "INTC",
  "ICE",
  "IBM",
  "IP",
  "IPG",
  "IFF",
  "INTU",
  "ISRG",
  "IVZ",
  "IRM",
  "JEC",
  "JBHT",
  "JNJ",
  "JCI",
  "JPM",
  "JNPR",
  "KSU",
  "K",
  "KEY",
  "KMB",
  "KIM",
  "KMI",
  "KLAC",
  "KSS",
  "KR",
  "LB",
  "LH",
  "LRCX",
  "LM",
  "LEG",
  "LEN",
  "LLY",
  "LNC",
  "LMT",
  "L",
  "LOW",
  "LYB",
  "MTB",
  "MAC",
  "M",
  "MNK",
  "MRO",
  "MPC",
  "MAR",
  "MMC",
  "MLM",
  "MAS",
  "MA",
  "MAT",
  "MKC",
  "MCD",
  "MCK",
  "MDT",
  "MRK",
  "MET",
  "MCHP",
  "MU",
  "MSFT",
  "MHK",
  "TAP",
  "MDLZ",
  "MNST",
  "MCO",
  "MS",
  "MOS",
  "MSI",
  "MUR",
  "MYL",
  "NDAQ",
  "NOV",
  "NAVI",
  "NTAP",
  "NFLX",
  "NWL",
  "NEM",
  "NWSA",
  "NEE",
  "NLSN",
  "NKE",
  "NI",
  "NE",
  "NBL",
  "JWN",
  "NSC",
  "NTRS",
  "NOC",
  "NRG",
  "NUE",
  "NVDA",
  "ORLY",
  "OXY",
  "OMC",
  "OKE",
  "ORCL",
  "OI",
  "PCAR",
  "PLL",
  "PH",
  "PDCO",
  "PAYX",
  "PNR",
  "PBCT",
  "PEP",
  "PKI",
  "PRGO",
  "PFE",
  "PCG",
  "PM",
  "PSX",
  "PNW",
  "PXD",
  "PBI",
  "PNC",
  "RL",
  "PPG",
  "PPL",
  "PX",
  "PCP",
  "PCLN",
  "PFG",
  "PG",
  "PGR",
  "PLD",
  "PRU",
  "PEG",
  "PSA",
  "PHM",
  "PVH",
  "QRVO",
  "PWR",
  "QCOM",
  "DGX",
  "RRC",
  "RTN",
  "O",
  "RHT",
  "REGN",
  "RF",
  "RSG",
  "RAI",
  "RHI",
  "ROK",
  "COL",
  "ROP",
  "ROST",
  "RLC",
  "R",
  "CRM",
  "SNDK",
  "SCG",
  "SLB",
  "SNI",
  "STX",
  "SEE",
  "SRE",
  "SHW",
  "SIAL",
  "SPG",
  "SWKS",
  "SLG",
  "SJM",
  "SNA",
  "SO",
  "LUV",
  "SWN",
  "SE",
  "STJ",
  "SWK",
  "SPLS",
  "SBUX",
  "HOT",
  "STT",
  "SRCL",
  "SYK",
  "STI",
  "SYMC",
  "SYY",
  "TROW",
  "TGT",
  "TEL",
  "TE",
  "TGNA",
  "THC",
  "TDC",
  "TSO",
  "TXN",
  "TXT",
  "HSY",
  "TRV",
  "TMO",
  "TIF",
  "TWX",
  "TWC",
  "TJK",
  "TMK",
  "TSS",
  "TSCO",
  "RIG",
  "TRIP",
  "FOXA",
  "TSN",
  "TYC",
  "UA",
  "UNP",
  "UNH",
  "UPS",
  "URI",
  "UTX",
  "UHS",
  "UNM",
  "URBN",
  "VFC",
  "VLO",
  "VAR",
  "VTR",
  "VRSN",
  "VZ",
  "VRTX",
  "VIAB",
  "V",
  "VNO",
  "VMC",
  "WMT",
  "WBA",
  "DIS",
  "WM",
  "WAT",
  "ANTM",
  "WFC",
  "WDC",
  "WU",
  "WY",
  "WHR",
  "WFM",
  "WMB",
  "WEC",
  "WYN",
  "WYNN",
  "XEL",
  "XRX",
  "XLNX",
  "XL",
  "XYL",
  "YHOO",
  "YUM",
  "ZBH",
  "ZION",
  "TSLA",
  "NET",
  "DDOG"
]

Enum.each(symbols, fn symbol ->
  IO.puts("\n\nCreate symbol #{symbol}...\n")
  {:ok, symbol_record} = Symbols.create_symbol(%{symbol: symbol})

  IO.puts("Fetching quotes for #{symbol}...")

  case YahooFinance.historical(symbol, "2019-12-01", "2020-01-18") do
    {:error, _} ->
      Logger.error("Deleting #{symbol}...")
      Symbols.delete_symbol(symbol_record)

    {:ok, {_, [history]}} ->
      # column: "Date", "Open", "High", "Low", "Close", "Adj Close", "Volume"
      columns =
        history
        |> String.replace("\n", ",")
        |> String.split(",")
        |> Enum.chunk_every(7)
        |> Enum.slice(1..-2)

      Enum.each(columns, fn row ->
        {:ok, date} = Date.from_iso8601(Enum.at(row, 0))

        params = %{
          symbol: symbol,
          date: date,
          open: Enum.at(row, 1) |> String.to_float(),
          close: Enum.at(row, 2) |> String.to_float(),
          high: Enum.at(row, 3) |> String.to_float(),
          low: Enum.at(row, 4) |> String.to_float(),
          adj_close: Enum.at(row, 5) |> String.to_float(),
          volume: Enum.at(row, 6) |> String.to_integer()
        }

        Quotes.create_quote(params)
      end)
  end

  Process.sleep(400)
end)