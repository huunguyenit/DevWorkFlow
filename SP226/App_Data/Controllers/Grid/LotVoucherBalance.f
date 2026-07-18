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
  <!ENTITY TransferID "LotVoucherBalance">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uA7YWGRIKnI9x0tKN5yf5nWMX1S41inKp0JTWfM4tDVnkin4NCbSgFmfUZrBd3GfWLiZsnEc7aKMBuI3Z7hM1NMeEBgRO/JcAjTZ3dmyi98pXz9d6nub9B8gaVOhvyoKqnoxBVtNvl7fJRFl+EKMsaNPrpaGRbGtGFrKp2WGkLenBWC+1mwEVXgYGVa9x+U9OlsLVGrDhekg4ciaiK9ZCzshQAHP5tYMsx+6sttvT+5IVyNAJ7OBk+rHhZ1Xc7En5ZT/CbGAj7N9O18gZfTE7j6HzI5oFVW75+KrNnrUTJ/ji8RKtxBR+3EdVAJqPbAZbFCFR6ALovwY2LPFuM2iY/vKZAW8tM6yRD3VuLf1pd6t5uyAPCJaGCKmO1es7OHHZFastBusiness.Encryption.End&CommandControlLocationLotLoading;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4ZJcpO/GzD76O/cRmNIKsghugycvCcdcyKapxyiEkpnUoCgAlHNRhoeYJ7fqzv4rZeIWP1Xibb5z/NEgB4PaTaXrkduTXBqThTH/HkmLljwQtB+fknaVkYMk3kDXteqNXYI34E+YevcMaePfiZLTYR4eZiA9P1QgflpLLjdeg7yg2ccDcDK5z1L5WXZ2UGK79afyU4OzCVkPzV5TrLrOH+2oNdKq4sexpijpgB8VILha0WNJUyvhGVwl/oH6sRBYjmw+b9zRM4DMthf3rMZQHPE=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
]>

<grid table="vcdlo" code="nam, ma_vt, ma_kho, ma_vi_tri, ma_lo" filter="&FilterCheckAccessSite;" initialize="&SiteRight;" order="nam, ma_vt, ma_kho, ma_vi_tri, ma_lo" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Vào tồn kho đầu kỳ" e="Stock Opening Balance"></title>
  <subTitle v="&SubTitleBalance.v;Cập nhật thông tin: thêm, sửa, xóa..." e="&SubTitleBalance.e;Add, Edit, Delete Information..."></subTitle>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" hidden="true" allowSorting="true" allowFilter="true" allowNulls="false" dataFormatString="####">
      <header v="Năm" e="Year"></header>
    </field>
    <field name="ma_vt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" allowNulls="false">
      <header v="Mã vật tư" e="Item"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Description"></header>
    </field>

    <field name="ma_kho" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" allowNulls="false">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="ma_vi_tri" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" allowNulls="false">
      <header v="Mã vị trí" e="Location"></header>
    </field>
    <field name="ma_lo" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" allowNulls="false">
      <header v="Mã lô" e="Lot"></header>
    </field>
    <field name="ton00" width="120" allowSorting="true" type ="Decimal" dataFormatString="@quantityViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Tồn đầu" e="Quantity"></header>
    </field>
    <field name="du00" width="120" allowSorting="true" type ="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Dư đầu" e="Amount"></header>
    </field>
    <field name="du_nt00"  width="120" allowSorting="true" type ="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Dư đầu nt" e="FC Amount"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>

      <field name="ma_kho"/>
      <field name="ma_vi_tri"/>
      <field name="ma_lo"/>
      <field name="ton00"/>
      <field name="du00"/>
      <field name="du_nt00"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvm7MVgOOwo6XEBkj6E/S0JmtEZbhdWZ+Qv4C/WuRCeJOkzPkbqjtFBM66nP0MNftrf1x9Tz1HnAreI1MTbpqs+aeFZbtCTZvWaKOIsBPkdFtL4vDZgEi9tPWZ+QMcyK0T+GBTPQq0EtuD3yk8Dsr7pXvH1Q5EuAtCjx47ILRyDjvwjfHWgcnl12CY707kZgLu6k0AKI45ze+52uxjPTwMiXuOYif5nhrdPDEcpnKuEB+dTEVxljwbgFzuRH2eB8fT447tLLhg0Rp+Vz2bGoG5vanoxvkBm16nvmm1kxxEWmeJh4rQ4eJEM+QJJ4JTtU89pq1Per/R1IMWLFAA+82QP1JDFJCIInG4uHtQHlC00MxoNQAFhWwOV8cAkVGPjoEBLt59Hsb2vuXMSrgu17SDZrzCpZiMQKq/WLcE/Sqgj04W9qKAIBto2T4GKhpUxrpdZsZ3pemyBoGp6lVFATEnpbgS3fRqHglWXxyyVKDBKFPbhzZ7OKv+fbEfgOtfe9yRrtHl9FjThTJzIiaeffFOWEZDZx/WB1sAu8rnrEV+WzWj6/4pATLMAWk7D1rPqbrS4oEhuWHbnUOrVS3U2us8BsZq31RWuqTIqSCTvZch0Vp9w764rOFqq7JSTalGn0WZjt3M4MfiUjIRHMgM9x+Vv9QA+G5BvtD4U05eaEd0fkunttZPMWwM3hMqZET+4dkICSO4tNw+piVMhB9q4UHeU8JuKaJcjKMI17JqHCEoJhvID9nwR0uF/XwSD+HXhZrq4=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGtoRsGxYkOOVrszfyhmmp7NypjzP6L0az/MTGcqttLO9HCej0gvhYC8udGq/aeHkrs3Mnf5zpUHB2dPO7HJW/HDgCtSGUvXuXJzS5VMd1AI/dbEpq0QSKK+pn087Nbyt8nOD/i7ac9u5lDdLGIcggmz34SlWOg4GstKxWSSjwmta9voO3MtDSMOmqCIER171j0BNLBCBLdmgM/p7sT/lpKkbGHcZswfCcVKYQUK8zhfLCJuVBeGs1as6WWSkV2+I8xqnNXNC9apMcAZmqzIMw5+mqyIeOPbNkGGlKb0GRojozLhvtaWA/rb3AlK3+ShQ5Cq3KqC1tPO+EN0nYrjSFagM6ZbtiFPg6Yu2qNSdRF3WAxPuRcj8LdWRAF4fAUN91QnZoZbOauRTM/27/E+k3uHXnQJ/R0GVDLKj9iE2nPxHGpZD6E6/cLC6d9qeeV3Xh1BP1yzkkrK7E2KGhTBAKl8lrrIgPfE9vJFjB/JRmZYZtsiEbtYcQGjOkHkeC7dN4jSwf+kGz/+h1c8Iu7V2xON</Encrypted>]]>
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