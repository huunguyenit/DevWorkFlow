<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessSite "@@0">
  <!ENTITY SiteRight "exec FastBusiness$System$GetGridFilter 'ma_dvcs', 'ma_kho', '', '', @@userID, @@admin">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "MRPSalesForecast">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVZ0L93aWSIeygwUgHSL76PnGLsk/o266Y/1zF3jlhuQrObTNEhg7g2E3pajf9t7PqDM1jwk7xBMGZ8CHi3TDycpP8ZDiF3y76sFiFefG8N+6mQQhOfBzmmOo3Qa9sm8QIKYTD4lBKC+t2BzFlhmddEMQl1pNZNs8CkZSlO9arYDdw==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vmdbbh" code="ngay_ct1, ngay_ct2, ma_vt, ma_kho" filter="&FilterCheckAccessSite;" initialize="&SiteRight;" order="ngay_ct1, ngay_ct2, ma_vt, ma_kho" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Dự báo bán hàng" e="Sales Forecast"></title>
  <subTitle v="Cập nhật dự báo bán hàng: thêm, sửa, xóa..." e="Add New, Edit, Delete Sales Forecast..."></subTitle>
  <fields>
    <field name="ngay_ct1" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Ngày bắt đầu" e="Start Date"></header>
    </field>
    <field name="ngay_ct2" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Ngày kết thúc" e="End Date"></header>
    </field>
    <field name="ma_vt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã vật tư" e="Item"></header>
    </field>
    <field name="ten_vt%l" width="300" readOnly="true" external="true" allowFilter="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
    <field name="ma_kho" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Kho" e="Site"></header>
    </field>
    <field name="so_luong" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="dvt" width="100" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
  </fields>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibMbgBKX+0XSN0QTXpyMAdpCBOrXc7tBA0FETyg/t6ghjP1Y8g+UlhsLjlObvBuXORFG8odd5gVk3f9ed8QU8EuXulDdMuQikvhFbODep0pQ5YXbFTw5EtQ2DiPCtT2P1SVOY+T5sqLmEi8sRriJeuh7/vCCfFZbQn5W/3DWBEx5J3a806vFHUNXEh+P96yJrSEAdC01UsHb/5GqPGudXxs7DXn5NGDPETdUiUENihIyju7stUxy39fb8UJUTuKxzdF6lgGN0F8fuE1PsDk4c8cx2qYyWsYMEwyv0QREAWG3bvdp6WFkKo+R8qxZ3+M9un9IhhosDtWIxgBxG7yeyUXISr7Dr+T9nBIY35Ba47dimYf9RXso5mm3vMO2HSfAbUeuervMCS2vzIXMyngIonWFxXxwxSvxOVEXTWU/ioFw=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNSid6WPuJuZBfreJpvwpkKqA6PhOrBbuvotdAjQy4AjRylY7PbPZ/MrPEMQSCaRBlkwncik0vrUv0hdWzxFm7A=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <views>
    <view id="Grid">
      <field name="ngay_ct1"/>
      <field name="ngay_ct2"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="ma_kho"/>
      <field name="so_luong"/>
      <field name="dvt"/>
    </view>
  </views>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTgJR8w72Rcos3fzQhsosfNCzEmq9RWwPnc0y6QyHsYIATqNUAMshmPK1c1Glna0jEvcEsu1EPC/dU9F7lt65au9I3VaBaPp5lFhrMyNQ3DcvQhkIXnTdyN4WICa8zXxW9A8JWCBoBf4pZW1tuTgVL10VqzWKzu6U3MW+V2NbVvYBNbV9bUePtg1K/32bOvrvF+X1i3RRj1GEE02Z/oHm/GHQayU8rAZ7sKIJlhg2KsfH0l3VytzexcRdqn7b+iac1gWIRFYGt90D6V75BtXbEVjdugDzhIldydlrGGxAjiaxtqURCuynRz3AAd7R+otXmoApzxCfPJl72T1fKqAXTOBF/PRPoaFOYK5mjfv1ttC7N0LcmLvNPFisEFGwCMxJXNV4IvP4VUKZBDxVopwxdY5iIsVXh715xn2JV+6NaA2L0L3tQsuQNuIYPBswiyYiVkptjwhbplw2Eiymz0AMIO+wWJPdWxVlR/zGeo4dvTIy3Mp6/W5H+KIeE09uCax1RAnoWXbEuS2qXBq05hZ7DM1lDv4g+atPkCLw7BgahS05XcsGZGITMV4EIBeJA/MyYxDNkNtxL9DfB3sKfkAATk=</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6HxhnS8rGXsILZQU7MG6tihTqkxU1cqCt+DhMnIAxvtiVx57BjcQDbAUJEh8YY8WcO1qpdWa9pVuBxk1RvOxgKd1KkZvc3+Vkj3M9TCsMXCvMZVtfPbag/RR1xwo7o4q6kV9VHCYL6BT/uaBFro6K3/Z7Jj0KczAMgfGV94G81xU4qY7y4Pw26W3qdV8DPounpltNcBQybzj24W5ku8OIneB6Rz/xm3zkQa3GsnhuY/wXoeLYSWzlbEur0tkNCB3KFEaH9JWrCmtfjbaeFTEUNZ7orUkdf6+S3fNI3Tpb6Y9OFZqlZteqFnD16t3aagew==</Encrypted>]]>
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
    <button command="Generate">
      <title v="Tạo bản ghi tự động$$$90" e="Auto Generate Sales Forecast$$120"></title>
    </button>
    <button command="Erase">
      <title v="Xóa các bản ghi$$90" e="Delete Records$$90"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>