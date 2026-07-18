<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "CashFlowPlanByWeek">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVZ841wuAdW14O7JzGJaGe7rySiVRQiOfVG5zlT/cKxbkAbDwz6cCuNuV0pNnxniZTqyWzfdoPXzp0XzZpnw3TNRbX+lMWzosdcRxdTWaoJ+0EeR/mVBoVf68hHeRx6zwap6ypnBufnVyoEJauktcGfqbKXeIxaCBf2TPvs6U6rnBOOveUq2/Ibuue7+q8NKPqeVAHO0b36t72FNiMfCoWUUFastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vkhdttuan" code="nam, ky, ma_dvcs, ma_bp, ma_vv, ma_ct, lan" filter="&FilterCheckAccessUnit;" order="nam, ky, ma_dvcs, ma_bp, ma_vv, stt, ma_ct" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Kế hoạch dòng tiền theo tuần" e="Cash Flow Planning by Week"></title>
  <subTitle v="Năm %s" e="Year %s"></subTitle>
  <fields>
    <field name="nam" type="Decimal" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ky" type="Int16" dataFormatString="##" width="60" isPrimaryKey="true" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ma_vv" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Vụ việc" e="Job"></header>
    </field>
    <field name="ma_ct" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Mã chỉ tiêu" e="Article Code"></header>
    </field>
    <field name="ten_ct%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên chỉ tiêu" e="Article Name"></header>
    </field>
    <field name="lan" type="Int16" dataFormatString="#0" width="0" isPrimaryKey="true" hidden="true" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Lần chỉnh sửa" e="Revision"></header>
      <items style="Numeric"></items>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="stt" type="Decimal" width="0" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ky"/>
      <field name="ma_dvcs"/>
      <field name="ma_bp"/>
      <field name="ma_vv"/>
      <field name="ma_ct"/>
      <field name="ten_ct%l"/>
      <field name="lan"/>
      <field name="tien_nt"/>
      <field name="tien"/>
      <field name="stt"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibMbgBKX+0XSN0QTXpyMAdpCBOrXc7tBA0FETyg/t6ghjP1Y8g+UlhsLjlObvBuXORFG8odd5gVk3f9ed8QU8EuXulDdMuQikvhFbODep0pS2qj/uuzcHhXTRKVozwb05WTPOtJcTKeyhp1sjCTadA5xGbYNdmru4ge37Fv/jOIMGvDMBeNlAQzaeWu1z4MLTRH8txb9hyvaBjl3fdZuaJQ7OvfQQh+94sE3aVj7B2JQ3bD0wLxCpykTBXQoM4NkfOZGUaOWxAGdvZkWXQeFDObBkhHzAw3ALoEbfSrsg37Y6O11/P73OkOfCs2EwdEZySrpK0iiuT4/yomMG7IX49W6F/Gi7AfbohrVa+BUzjPRj1vyv2cbkja3lbuvijBOK0CZG6L7RptNw6uQe7Ine+cd4uz0LB25n61d3F6D29nZyU+bkyAxtvDRFcNFGM1rA</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcI/RlaCB8zeKbN6Fva99UeuXKnFM/1UumnXZ0kTs8IEHhbup47nj/rPwJgRYwu5PydFkqk726UNPteCjC2EskwCqZh5crgARpm7VRRPRh4iq</Encrypted>]]>
      </text>
    </command>

  </commands>
  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXsQ9vQb4fNz+AID8UiJiSiKQkBMceWR7WEqwwNBhzR6ZxB1FFcQNVzZho6iseecphtGeCB3ImEls80by3hqxUVhM45OcwvFhmVikNR6LoY5pommD1Io84c7uTX6CjSZZiBPLk6qKGvzkVvtEfa4Lr9fBgNr1J3qyvn0/bwjNluGv46PtuprLL/FbT/Qkx9H2WZVDPi0eJyZ8DJKxRv28nRqDbbYSBwAhvfNfKUYbsMbTlXqTz6GE0fDkGypurUS/uuHRnprEkErJGjbO+7XCCIoYMkpWs5Xt3iCRHfOqVD/LABjb3NuwsNffSFi18Gr0A/Kl1aZnNVw8I+8WK+Nl97gseRciub+zPtYHSctkei6sauyrQE0Ihkx26mW9kOQcOEiyV0DYazlDQV+XeyBPWeyvlWGjFayNphWrNxOQnSEwXypL/kjYJPfqw5HCkKR6TU3BNY/iwDPKjbY921i7eUw5keOflbRwnGVj94El9DiqcZfY5WonESAJs7dhVNGxpFlP2OfeiskbAdLRa3zZt09QBwX+DK5AHtTWj0zVoMr</Encrypted>]]>
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
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
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
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>