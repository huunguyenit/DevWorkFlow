<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "SFCReasonList">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVbQRWfvqfuec2TGfcKLza/DGRdANvTP3PBS2jP5giffxWk1BEo45mGtF4ickEbsFATwpYZgf63KhpaUSQYOQr5gTi5Mz6BMeGHBaTljP3IkHcfdp0ADU7CfkDrCxSzCyP4m2afIdz9qZF84P9EdoQ/B8zBAyfw9HQE4zSyCGsmo+A==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
]>
<grid table="sfdmlydo" code="ma_ld" order="ma_ld" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục lý do" e="Reason List"></title>
  <subTitle v="Cập nhật lý do: thêm, sửa, xóa..." e="Add, Edit, Delete Reason..."></subTitle>
  <fields>
    <field name="ma_ld" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã lý do" e="Reason Code"></header>
    </field>
    <field name="ten_ld%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên lý do" e="Description"></header>
    </field>
    <field name="ma_nh" width="100" allowSorting="true" allowFilter="true">
      <header v="Nhóm lý do" e="Reason Group"></header>
    </field>
    <field name="cp_tt" type="Decimal" dataFormatString="@generalCurrencyAmountViewFormat" width="100" align="right" allowSorting="true" allowFilter="true">
      <header v="Cp trực tiếp" e="Direct Cost"></header>
      <items style="Numeric"></items>
    </field>
    <field name="tk_cptt" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk cp trực tiếp" e="Direct Cost Account"></header>
    </field>
    <field name="cp_gt" type="Decimal" dataFormatString="@generalCurrencyAmountViewFormat" width="100" align="right" allowSorting="true" allowFilter="true">
      <header v="Cp gián tiếp" e="Indirect Cost"></header>
      <items style="Numeric"></items>
    </field>
    <field name="tk_cpgt" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk cp gián tiếp" e="Indirect Cost Account"></header>
    </field>
    <field name="cp_ql" type="Decimal" dataFormatString="@generalCurrencyAmountViewFormat" width="100" align="right" allowSorting="true" allowFilter="true">
      <header v="Cp quản lý" e="Overhead Rate"></header>
      <items style="Numeric"></items>
    </field>
    <field name="tk_cpql" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk cp quản lý" e="Overhead Account"></header>
    </field>
    <field name="cp_dv" type="Decimal" dataFormatString="@generalCurrencyAmountViewFormat" width="100" align="right" allowSorting="true" allowFilter="true">
      <header v="Cp đơn vị" e="Unit Cost"></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ld"/>
      <field name="ten_ld%l"/>
      <field name="ma_nh"/>
      <field name="cp_tt"/>
      <field name="tk_cptt"/>
      <field name="cp_gt"/>
      <field name="tk_cpgt"/>
      <field name="cp_ql"/>
      <field name="tk_cpql"/>
      <field name="cp_dv"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibMbgBKX+0XSN0QTXpyMAdpCBOrXc7tBA0FETyg/t6ghjP1Y8g+UlhsLjlObvBuXORFG8odd5gVk3f9ed8QU8EuXulDdMuQikvhFbODep0pTxKncLC6eTCXkobbISN2PLRPv4JBeV5lEtLyKX+GvGOfsR90V7FmEJaw1zkBtaHz5Epo9Z1u+IpH8O3Y+6M8tL+2xReoiufkWGPs8elFuKm2oHswcs1Y7zouSPiBY6ivfNlfKXvEMtTtvQUOxUa9rJ</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcG8PJkXTolyVU1cDSbfH1enwzksh9XGypRwiWd2VJIlaFjCFe7P482000FDE1/3+KK2pHQWM0lUW+CiniYTliaO5rK+2fJAy0167FqopjFrT</Encrypted>]]>
      </text>
    </command>

  </commands>
  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtb7wM1KtXc4BbeIpelzDrS4IU2+8jXVKMfXkDCHNNCGHZdNSF+I6xeNbXFQZS5qpnsTPFfSBKPY/7eOG0IFPSmlBmEMrSwNFli8QcLuXByPw8cfwO4lMm085mdAKHQLNGsZhu5j6qQ8ldfipY3X9J8s6ATAjLU7uVSxUZw8OpOX8nCvRzUkjo+q0trNMhbmjzEAbIfeQWUU4+G9NWSCi9WSclJrVmtg/jNeWIGkVuBUfQKbFWC5K+NHElKCYT6Xfe2w3I3H/1IOg29osi78egrVUyVVLPaLqzBzEoalMuLQC/ynZd9CJzxDcQnT7u7jd8Zk/fIuIJZXsbM5AOzteUzRBSUU5elHZyuewQDUW83PRtz704elJjkS7eY0bHmK8b7O7LnS7uZA3jBY9hBQGzniysseyh7KAZC4STVWzsduSVu0TpCLcDZLC3iTsilJXeHKuSGUsLaxg+lR5w3NrRfxuwq2coONJvLEd19+Rsk1BRd7YGACmPOjPSr82gpLHKQ==</Encrypted>]]>
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
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
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

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>