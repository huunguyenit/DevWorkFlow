<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % SubTitleBalance SYSTEM "..\Include\SubTitleBalance.ent">
  %SubTitleBalance;

  <!ENTITY FilterCheckAccessSite "@@0">
  <!ENTITY Code "">
  <!ENTITY SiteRight "exec FastBusiness$System$GetGridFilter 'ma_dvcs', 'ma_kho', '', '', @@userID, @@admin">
  <!ENTITY CommandWhenBalanceBeforeInit SYSTEM "..\Include\Command\WhenBalanceBeforeInit.txt">
  <!ENTITY CommandControlLocationLotShowing SYSTEM "..\Include\Command\ControlLocationLotShowing.txt">
  <!ENTITY CommandControlLocationLotLoading SYSTEM "..\Include\Command\ControlLocationLotLoading.txt">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "FIFOBalance">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uA7YWGRIKnI9x0tKN5yf5nWMX1S41inKp0JTWfM4tDVnkin4NCbSgFmfUZrBd3GfWLiZsnEc7aKMBuI3Z7hM1NMeEBgRO/JcAjTZ3dmyi98pXz9d6nub9B8gaVOhvyoKqnoxBVtNvl7fJRFl+EKMsaNPrpaGRbGtGFrKp2WGkLenBWC+1mwEVXgYGVa9x+U9OlsLVGrDhekg4ciaiK9ZCzgxHJdHnN7AM4UcPu+qzJyF8GClKbnTfRKQUcXXM06xqt2Yc/jB1hOmT6n6IElfP7Cm3o+BQwt9kAkyaVUayrR3H2b8wkLzxgNNVMJULrE2z8Rt+wfFFO3xpSnYVXtQNJIuD9LdPNYyED71GqtykUuQDY56+xugoKAfE+iZ68tm/1jFtEbh643pIsg7/ZAfldw==FastBusiness.Encryption.End&CommandControlLocationLotLoading;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4ZJcpO/GzD76O/cRmNIKsghugycvCcdcyKapxyiEkpnUoCgAlHNRhoeYJ7fqzv4rZeIWP1Xibb5z/NEgB4PaTaU2miIooYHxiF9EpeQVWWqJykfR5Q5Plp31ZbIktvOaqFtiHAhmzo+Si0dlg9FHlIoUxaAoQRAPUp0DHNjuIH1oFv/4jCD+RWs1eQZbF/9U5/sAXUZbqcrWMbDGfBV6fTIbGjWjZ2BX45dWqpxtiMFrhvnWENpm4v53Zg9nOwpN/8qWWr2AtHTyFmKPHsFLG2c=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
]>

<grid table="vcdntxt" code="nam, stt_rec_nt, stt_rec0" filter="&FilterCheckAccessSite;" initialize="&SiteRight;" order="ngay_ct, so_ct, ma_vt, ma_kho, ma_vi_tri, ma_lo, stt_rec_nt" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Vào chi tiết tồn kho nhập trước xuất trước" e="FIFO Stock Opening Balance"></title>
  <subTitle v="&SubTitleBalance.v;Cập nhật chi tiết tồn kho nhập trước xuất trước: thêm, sửa, xóa..." e="&SubTitleBalance.v;Add, Edit, Delete FIFO Stock Opening Balance..."></subTitle>
  <fields>
    <field name="nam" type="Decimal" width="100" isPrimaryKey="true"  hidden ="true" readOnly ="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_nt"  width="100" isPrimaryKey="true" hidden ="true" readOnly ="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0"  width="100" isPrimaryKey="true" hidden ="true" readOnly ="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" width="100" type="DateTime" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="so_ct" width="100" allowSorting="true" allowFilter="true" align ="right">
      <header v="Số" e="Number"></header>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã vật tư" e="Item"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Item Description"></header>
    </field>
    <field name="ma_kho" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="ma_vi_tri" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã vị trí" e="Location"></header>
    </field>
    <field name="ma_lo" width="100"  allowSorting="true" allowFilter="true">
      <header v="Mã lô" e="Lot"></header>
    </field>
    <field name="so_luong" type="Decimal" width="120" dataFormatString="@quantityViewFormat" allowSorting="true" allowFilter="true" align ="right" aggregate="Sum">
      <header v="Tồn đầu" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" width="120" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" align ="right" aggregate="Sum">
      <header v="Dư đầu" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" width="120" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" align ="right" aggregate="Sum">
      <header v="Dư đầu nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="stt_rec_nt"/>
      <field name="stt_rec0"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="ma_kho"/>
      <field name="ma_vi_tri"/>
      <field name="ma_lo"/>
      <field name="so_luong"/>
      <field name="tien"/>
      <field name="tien_nt"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ia4XDMcx1FoIIq08b4bJZpbVjAXhuAeZ8AEa5tYn3akA=</Encrypted>]]>
        &CommandControlLocationLotShowing;
        &SubTitleBalanceShowingSelect;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvm7MVgOOwo6XEBkj6E/S0JmtEZbhdWZ+Qv4C/WuRCeJOkzPkbqjtFBM66nP0MNftrf1x9Tz1HnAreI1MTbpqs+aeFZbtCTZvWaKOIsBPkdFtL4vDZgEi9tPWZ+QMcyK0T+GBTPQq0EtuD3yk8Dsr7pXvH1Q5EuAtCjx47ILRyDjvwjfHWgcnl12CY707kZgLu6k0AKI45ze+52uxjPTwMiXuOYif5nhrdPDEcpnKuEB+dTEVxljwbgFzuRH2eB8fT447tLLhg0Rp+Vz2bGoG5vanoxvkBm16nvmm1kxxEWmeJh4rQ4eJEM+QJJ4JTtU89rRq8lNfk+C45dJlGmmyN1eOuVncHvPi5qZ6R3jgOoYeLuxSeEfh8CRI6uLosBjyXHOo6f576IvkKs2mjt3pz+ALh5+/llgFuiNohBS1qoHy/DH0nXbqu9aZQq+Zltbw4k5aK98QqhAiJs+ZjcdcobGOUjhNA8a495ZdrHTh08o4ZS6m54EHIe2FeCYcfYM6fUVmEHZQCQ7PqG7EJokodjt841ObVNyTidW9ADyJSHtx7NdHbI4zCZSx1SYEr+BFZsu+5hNqFnGfeSx1OvWRJ10++JXJput9eGoM5fO1MZ/c3JXInWsCo56RK4fSTEm8LO9d5swW6sTZVJHMEG4S+SFIBtz/qyEXIJInEQAkiIbCF3pJPdSGkAbm53tEKNevqQnZCJA+fti8tN8gUh+7yjX34b9Mv1eJQ+5hx1nKnlEUw==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGtoRsGxYkOOVrszfyhmmp7NyciWYHO9ayoFLgZyKUjFusfPxSU3BIc9FQeQYew2Eoyrsr+x00jv/BZXsWRrde+QRznbDFfr3d0z7VpYTgvbjm8a5Dd03RyXjx4KPPWF8M6KepJDvh4eDNkNGZjdgIUD+XZ8+H0+hY22eKIwY3ujZWi0FCZCM+zVCob4cfETDsXMsLqDeb1SEwX1cTOlmFZHIEgVL1z7yOiFwdtY4R8Gq9UXb7HDwta1gXtUejfD6U5XQyYraIdFGrdWDvCaJMoWu9A9U4zWVnEk1/XAARaecLr3tFaUm3j5l41eTNdchVWqeQuRk2smZaioEU5pDuYbrWFXHVqmkx6ipjA6ZKzzKAAmMvul4fAi297EV0dKRAFK32UV5qKgg44Hdg/NLWWo70TOlVB2vHZtvSXzKHzil8ScshdANXlPYFJqxtST5Dec1DUFCRF/o5Dj/U5FxOgADapSc2kMhyt8C7nfq1gLKFW0D+vMwsCSKnyEZYea1vFAQ7byjTX8we8q2v9eyHLC</Encrypted>]]>
      &DowloadScript;
    </text>

  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+Zr88IlDe/oSzZRA1t8b0/0w3BqTKi7PnWnO02iO/Cwi4Gr5JH1yfJJpAAx17dZWFyA05PJJcj/N8dU0K9UVDsl</Encrypted>]]>
    </text>
  </css>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"/>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"/>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Aggregate">
      <title v="Toolbar.Aggregate" e="Toolbar.Aggregate"></title>
    </button>

    <button command="-">
      <title v="-" e="-"/>
    </button>

    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp..." e="Import Data from File..."></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu..." e="Download Template File..."/>
    </button>

    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>

</grid>