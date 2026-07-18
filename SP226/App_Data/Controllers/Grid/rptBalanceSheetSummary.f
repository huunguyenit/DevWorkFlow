<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng cân đối kế toán tổng hợp" e="Balance Sheet Summary"></title>
  <subTitle v="%f1, đến ngày %d2..." e="%f1, Date to %d2..."></subTitle>
  <fields>

    <field name="chi_tieu%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="ma_so" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã số" e="Number"></header>
    </field>
    <field name="thuyet_minh" width="100" allowSorting="true" allowFilter="true">
      <header v="Thuyết minh" e="Interpretation"></header>
    </field>

    <field name="tien_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số cuối quý nt" e="FC Closing Balance"></header>
      <footer v="Số cuối năm nt" e="FC Closing Balance"></footer>
    </field>
    <field name="tien_nt0" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số đầu năm nt" e="FC Opening Balance"></header>
    </field>

    <field name="tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số cuối quý" e="Closing Balance"></header>
      <footer v="Số cuối năm" e="Closing Balance"></footer>
    </field>
    <field name="tien0" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số đầu năm" e="Opening Balance"></header>
    </field>

    <field name="flag" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ss" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="chi_tieu%l"/>
      <field name="ma_so"/>
      <field name="thuyet_minh"/>

      <field name="tien_nt"/>
      <field name="tien_nt0"/>

      <field name="tien"/>
      <field name="tien0"/>
      <field name="flag"/>
      <field name="ma_ss"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHls1/nfOq4E/sdEe6I6f6ml5jBLOIKb1Li+0wv6iG8m7K2kca2P5LW7mmj2GPxqwX+Ss+GjXTjLi/eVSEeXC8M=</Encrypted>]]>
      </text>
    </command>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtVeWZvF3ZbQCsYnlgTz1idgonZiTEXDurxHTqI0LssIW4P7KeoVmM359EarFbqMh1M4ds+qnwcZZDTU43jIsrdd5pd7vKmuoo96ItUFOuVS1zQndbOM1GQuf/KD4lgkytcPEKyvogmY28xtYvjcIaVTadpTvQYC+pD5V9rwWDMf47nUDGImM4GHsjGrlZhKovsUKdYbZXeMFVhw3UVXVkbFO8PEmnRogqXC7MhOWg3TYWcAo9x7HWEFOQQzaOgRy4473lvn6XU3uf8UHUysgJl5VLAR4lV2e9TDR9e4UJ+nroU3YJH1sF5vKd95IdwnLqbfJRzvxUMM5E75lAt7JhVXmpwR74FhYgQlyXVXHJGwlhcv8eO6tW+vdN95Bp5ANwDwvH1GQLZ1caxOYaQN+0WcN+vCo7g52tHVYyIieqJD+muMwrPGEgkf8TvxtFi1VpHR7KO0NP3Qj5QLdQUS9XjKcDMoV+kjz5xjIEO08mBrG7F8SBMifybub87v6CalDhimR2hPi0872dOoj+NssATeuBKWwE3wd3Wsy3ChCweE2lp+GRv6R2jaihzc8AkU+Q0cGMfM4akLH8EWWsEJ6/mbeEIZ3lKeDf0Pw6bq7kCp8TjFJ5PaDS2flLibNPE6FtFDINlwy6vUGzu+E1zS3I3SM7gb5NmR2AOzJTnohAjURkESIE3oAa74ksJmkUlBiucxWXNW3vkcHhCmMETp8t7Jw0n+nougH9aCwn2LvO+7MvUlZD76AXYLxieosHq0QyMHG593kq1SsOC/KMUtXmRizTv4cHfmgp4I+zqLYymJz4QL3SQ2VtWMbCbbj+XNrGO4ncR46o92hePf7Avw557ArznNl4s/qZBEdUD+uNfAOO5m5ScbQWO/CqlU/D4BaWax2vEGiUOwNpNrQkoL26ZdW5t5tpudn6jwWF8lvLkiTy+83hNKE6HUVTCp4W8i/qna1X7kDMuZFAHTfxyaBfqSaRdoqetYMR+1OcPoRLN2+KP21ezc6mh5BmjKySy80+hRRdFLD4TAGmszH4KY25jgrrWqOIRQmjAAfwVnzsekFEi+DWJtHik8lwq4rIQFSxP1bZjE0AB1wgu1QJmwOx1RkoT1cCQ07ogiKl5RoR0QDqUOEZXYK562KyRNgkXhgAOWWjjotavsiMUgT+/8Ww6f4lg3jZGRllIVlkEPT8bw0kGVRMAFCAQh9q4Y7JA2QGASIlBxPW3pqtfvSGJC8OsVpbv7Ka7wHC6X7X3YyXYGlZvHMMpKIq63zdbX7RHZdIxJCnUK28Rdst/7K/y+RkWd15b3zCU5Ue1rju5JYZ4K3LD0Zn+muEdBtZ1O2vRE3DQ/yQ3TPeVQFDtuZlnq1JiMOSYAnVk7YuX+MVuRcEJDD6W2C6KtKlC6iF4+SH7KQYD7trFy9jeKrmCqSK9Xzhum/mbxDBiP4R8IRPkjWjHnEHJD4o1ANb2BGU03ghZ1MRG1INU/Ig5+bumf7mE8NzLbh8TQsc7pWaUE0Q2NXzCbnv4cM66Ih4+V0fnT6Dh0NtA==</Encrypted>]]>
    </text>
  </script>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"/>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>