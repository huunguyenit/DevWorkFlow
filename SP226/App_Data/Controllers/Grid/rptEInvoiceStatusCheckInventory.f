<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Kiểm tra tình trạng phát hành" e="Issue Status Verification"></title>
  <subTitle v="Ngày chứng từ từ %d1 đến %d2, chứng từ %s1 - %s2..." e="Date from %d1 to %d2, Voucher %s1 - %s2..."></subTitle>
  <fields>
    <field name="ma_dvcs" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="so_ct" width="80" align="right" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'" allowSorting="true" allowFilter="true">
      <header v="Số chứng từ" e="Voucher Number"></header>
    </field>
    <field name="so_ct_hddt" width="80" align="right" allowSorting="true" allowFilter="true" maxLength="-100">
      <header v="Số xác thực" e="Reference Number"></header>
    </field>
    <field name="so_seri_hddt" width="80" clientDefault="Default" dataFormatString="@upperCaseFormat" align="right" allowSorting="true" allowFilter="true" maxLength="-100">
      <header v="Ký hiệu" e="Serial Number"></header>
      <items style="Mask"/>
    </field>
    <field name="mau_hddt" width="80" clientDefault="Default" dataFormatString="@upperCaseFormat" allowNulls="false" align="right" allowSorting="true" allowFilter="true">
      <header v="Mẫu số" e="Form"></header>
    </field>
    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh" width="300" external="true" allowSorting="true" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="80" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="Currency"></header>
    </field>
    <field name="tinh_trang" width="150" allowSorting="true" allowFilter="true">
      <header v="Trạng thái" e="Status"></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="tinh_trang_hddt" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="trang_thai_tt" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="kieu_ph" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="dich_vu_hddt" type="Int16" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="so_ct_hddt"/>
      <field name="so_seri_hddt"/>
      <field name="mau_hddt"/>
      <field name="ma_kh"/>
      <field name="ten_kh"/>
      <field name="tien_nt"/>
      <field name="ma_nt"/>
      <field name="stt_rec"/>
      <field name="ma_ct"/>
      <field name="tinh_trang"/>
      <field name="tinh_trang_hddt"/>
      <field name="trang_thai_tt"/>
      <field name="kieu_ph"/>
      <field name="dich_vu_hddt"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuw7DP08FmyV+onsNvetd3m1o4O4UCSR3u+DkujOj/wfQmF0Pyt6EipGDJEX9pkiE/roeoXrin2n2NU5n1P+C9pNkIHVdR8IBbs94bu7g+85Ah0r7xPHmo+VSJfankgVfgmXaGicPm4xN/iY1jIj6jyRubnj8yYMOZKDEfYIzsBU8li04jgqpQQF+vWJkEFXw34wycxapPGBZsMixb9Vw3mOVIuw6hOpKi03zWBkQGbM7rwJWILtcEYVDffnAxjUPlHTFPCQYylU10VqU144PcKgiYUHgTkNuJQ6tCk7GkytQrpusSaVKGWF03lodDlgDkUE2OTsOrUkCIUPRz8PAKIzSJoJdWMZ9rsGNBRPy1wqQh27iYcmdX5Rs7Ujnr8b9QNFnSoqTmVAMdE3of8kBu36OSBQweLW495W3qQANG2DMS8K7o8fiIewckNut8g1Xy7X/9/OhjieAJYotiSBE76/v3mNNHCSKr/B5hXTUSS6x</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758FqqnKB3SEYOg/Qz+yjr8gnFb7QR2PmdFDi6tQrxh1KT5TnfYWzk2chMve5n4NHzeNGM0tkIWwXFXLQK4hwrOJd0uVGLvk/7pB1b+FK0ylS</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Q+ujiMg8ux85NZGeCdFadV8/ucECtHKtNDZGSAnKaq8jVX5TNGL76oK8oZOVkAuwiTH1uXPhAAYbp5ctH8TLtwi1HQhrGVe1xxa5jioNBGTL9pdqnYYff6t/hfpNNAADOC3C3AjTsz5jTbIfAI6PmtuM/+afVt09lWvZFM/9eY1L6ilSorCeMyWDQA7auCif+a67wZixfWQD6px2afwE3hRrB2FAVxUYto9gNsiwiR2GO0t4ynrEq+MKBaM1+GiMdawI8CJjsDASdsot5CT2xySrXCU1feWmAJHUXsb6hAq3OKrIKceoCJY4+63OKt62+YTIiViOjvQx7GsRLPMKQuahhMfLWxL0Gs1I+D3LpklS7q/YXBIwD8o6Aq6a3TmaGjFG2MHV/Gp6KG4bw+O7B9wN6lnxc+3mUuUjP/U75B5Ps6/cITe7V51D1R4oFilZDWHVDop/76Y12pY9BTwG3S9r+vcAQtuIf/9JrlnbTrep0cgdrC9KuEuRY/8dXk96QxFxt9Q0pup/1mADEO3wUCcgAtEjR7RaYr5xrOxNxisC+tntvdSZpfsjg9lOI4ghfJ/zsLRZW5k7t9X6Ka6x8XL+XMBp3LmFYUJScnJwYLeCbuL4gzUCOOEUDWwEXuuZUfvBSfNr3uA5urJZuOtY/jw7MbPYUNGVcxYGZMqWrH2rVt3yn2TxP5kP+mN0DMxFAHhOdGDRWfBinGvbvclOpZSW1R/yrYD3f+XvKmHi68KlBAVKBjM7xs/uXHh08EXMgvJ77J+RTGYKaXrnrUeM5LutZliUAJjrHM+/1bf+cv/EGyd+ig6ZkP7LBnDmNmQAN9L4NHJSdSaxtaV2wYbyt8YbMWYygnhDQNdauPLcHZhjaDO7Wfh/W2ip//GKIHtURKbr/EmU5xiZI/wVnkzRcSULSEauetGpmywANpJWX1Op8rxFyHaWP+5YVTgU08EW7hB8BHW/QpmDHs5jNR7PtNxOGZDvG8UfZg+sAA81ToQYlCPQqS5+r4oYjJfCjTUlk/73zN9CWsO4oM3rG4pwmP1v8U5pfAk69i1LCNk6fO8HxM4oX12L1caFLXASeaUP5Sqr2jHc/F5IdsMHKZIjmtx02nebVWwcoFVx50LKObCsPNlBfr2djqWPkGk/BV6qzdawq6R4BZcibblMNqOTd9G4S7eK500OI3X23NgOcYow/xqFpXKFz5Ray6QJt1ll5tBlaZreBcgr9g4dNt+2/a258q7Q4DwV7WIa6ZpR9RtX9A5fYzIW3JiOwVANnmPnzfwvnKYmZYlipjTxbp4/4/WGPdHh6M4TYf6aPZNEkqt5Z2K7/tkQlGy9ynHb7u2/Sn/6wA3dpKfyRbyh3N68VHA7gj02IyXXJAnNnHTWGofomN1U/P5A1/2J7Q8T3bzgdAN6i+5Pq740rT0owvdqY1zDfxA1icKrs03gY+CCPsA4DTir+vpHfkq83YiXQ6zDVjaRKPyGI6qh6NfmJdlH+KXtGeZkjooPiwPFEulcdKNyH7Jzasf3lcaTYet3rGvT4mizV5lbBgDHJYNtoahwe0Zibpp2oWiYFV7oqRKMba1BKsAQiGIC1h192HjlK84khSpJR0lhRv139Nn/bQQ8whEm3YlPHADoU1EGpsvMpK5kK2PTf6MQFiOAWnfRJ3n/ue/hQAIGlQw7NvXPewMk1+Sdod6+G2Syi/kcGBwTkHs97XiqppCXGAy5xzN9tySJvf7pOTqOJXEAOS9W0x0JuEWTZ8cfVjWU53AiovEpawl3InZ/YTfQsQaNoLHV4XRxa5kpshtYicNtyoDlOJb6d7VoekMKNKXcfZxuOwzpLjr2P+fo54Pe07MJpFPr6XODmtMaznVJL0oywle/gdDxLheXYoJQ3GCOltulM26WbRC</Encrypted>]]>
      &JavascriptReportInit;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwguLdDBpi8qI/DSTGBOgHy4ADNO1/F2HXbeqTTyragzFJe1gBMg5MvZoN3XxQRToplwu83ntmW+2z1Y5L5Wux8BEw/Gv4UL0ZjjhNdGoPzW8KlKhy1vG1ofcvPi51QDC+oZersymm+gieLmLmXTMq5ETik7+6Gr+xto3jpcojTt0FdBbSjAhbYTVwJHiCU5/A==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Verify">
      <title v="Cập nhật trạng thái chứng từ...$$75" e="Verify$"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Aggregate">
      <title v="Toolbar.Aggregate" e="Toolbar.Aggregate"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>