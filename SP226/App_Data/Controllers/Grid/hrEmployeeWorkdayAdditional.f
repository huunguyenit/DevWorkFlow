<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY TransferID "hrEmployeeWorkdayAdditional">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVax70DUAo2ZERG7RwV2VvCMkAraF2baA94n/tIruKm3pRWp92Yt17qQQTfHBD6bE6hHBkiPMQ53t3wh63+3EINqWggb82qU71aLckhp6QTd6a4Qh7cctqibLgdlnC5LHju5ahPWt3NHtXqwbgNhLY7PMhKpIoTmsMfcWmT7Qs3+DymjQr/zMRCPAvCpLEaQZXMBQnXXhatWclaW8/ertv17FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">

  <!ENTITY ExtensionTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+5MdwVcqFNd9aK91Iq98YyzB8OHv+MeSfnYO1df5Zt9yrzutTY1x90URzSza68TXpZTuosRvx0EQa6b4Q+NRDgduN0H/S0hIhQsHvM5XU+5CvtT90AAR9Ox4SldC7ejwq6zPLgnJuDxxR61sW1GusM0BREfosILgyl6a7BHEkFiYLrkgLv1pdflfv7KGVLgTuGP7pDYm9Mj7cMDNFYKorFMZ5aEgn/jebCzZXUTx2Vtbf+3Bwq5tQUzQJk4qtouhLUNKrTI6vhvsi6B8J9cp0DGxWs1aXkkGFg6T2DHsTVhh5eQ7ais6Kt4etMWewlTC/0vhF9xyUlodc9Mi8tcKNOeuERYpm8lQ1QLE5fxffXOJHUTHEWFzXgZ96sisiDwfb2nCPSztyZksIp9ZpriQ3mk=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFEDWTCvPLFUYiCQ4IUQB/vC2IBu9x3fWD7R4w7DxGpksH2QjPaJnA80dJt1oN0g/9Odmxr0BENvS+GlikXhEUE8=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vhrbscong" filter="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" code="ngay, stt_rec, ma_ca, ma_ca_ct, ma_cong, gio_tu" order="ngay, ma_nv, ma_ca, ma_ca_ct, ma_cong, gio_tu" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bổ sung công làm việc cho nhân viên" e="Employee Workday Additional"></title>
  <subTitle v="Bổ sung công làm việc cho nhân viên: mới, sửa, xóa..." e="Add New, Edit, Delete Item..."></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="ma_ca" isPrimaryKey="true" width="100" allowFilter="true">
      <header v="Ca" e="Shift"></header>
    </field>
    <field name="ma_ca_ct" isPrimaryKey="true" width="100" allowFilter="true">
      <header v="Chi tiết ca" e="Detailed Shift"></header>
    </field>
    <field name="ma_cong" isPrimaryKey="true" width="100" allowFilter="true">
      <header v="Công" e="Workday"></header>
    </field>
    <field name="ma_bp" width="100" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" width="200" allowFilter="true">
      <header v="Tên bộ phận" e="Department Name"></header>
    </field>
    <field name="ma_nv" width="100" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" width="150" allowFilter="true">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="gio_tu" isPrimaryKey="true" dataFormatString="HH:ss" width="60" align="center" allowFilter="true">
      <header v="Giờ vào" e="Time In"></header>
    </field>
    <field name="gio_den" dataFormatString="HH:ss" width="60" align="center" allowFilter="true">
      <header v="Giờ ra" e="Time Out"></header>
    </field>
    <field name="so_gio" width="60" type="Decimal" dataFormatString="#0.00" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số giờ" e="Hours"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ngay"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="ma_ca"/>
      <field name="ma_ca_ct"/>
      <field name="ma_cong"/>
      <field name="gio_tu"/>
      <field name="gio_den"/>
      <field name="so_gio"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        &ExtensionTicket;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzymPAypqKLihYOMIv6op1ZEPt/ITzivRQ59m7quav6+qBtB5juz30v7OK22jvprM2BHkETqaRH5GFuwYJUOcZ+T17a6naE+1OvcWuhf6bVpAHzIc3KVeUOB7UGBNDEBxGcO9G6kllDnBa8ERR9tZT2C7bOtXZljHVJx8pfWUHckU=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN5zf8chxzJIaUPW9138BJNKFwqbcZQHSkQGFT+PmECy2Menr+I82f3cIwWRazQk8AKKw71s+fLatja8FI0Z2wqbI9eQXJbqH7Sahky7ObWI</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0zU8wFbBLdZztRuEJ6O52hR1EghZJ0F4MLztTj0Pp2EoKXC0ITRBxy6vnr6gwGM6J6tDjE1T3YMdeZ3ZFHzoQ6o3AiTUphfx1OhSedMtmUQOYQmcFhUOB3NpXiTykQorwT3+KUCxDoL6JYU6WfR75Cj9AAj4PeoaZEvpZ1GcOTJe9yl4DnJ0lZp6Ip2C/ylzLKOGPVJzT8OpVH77KhISOxLynDQ5Zsoy++i9/tNJQ+uP6TGUJpUgEGJeA6NsGyI7wnQ+iShZl2JF+sCvbpdfMxVlnHEO57gaWePMKcx3WZEpKT1NmGON7iNd/g22dbRe4RfF6HDljxU9RoWIIVH1RHxFwB5m2Mc2lmp573hz17T9ag7x9vWegm39CVVbdwY/I/Wt1jp7bw4I3N07uZDFthW4iiuiR71EefRZbMidDYx8mtKCJS640iaZBhkwcs8/O1I3L5cI7LICFh435XmA22edcK5gw1+4RrI2xmaltMORKpNFVKS9K73tghKvj1Kg4cm0Sx0jVHzvY4xocBQpAzJItDU6m2Fi4Os6Gsz0f9uKj2dNa/XJwSn0lSrOAe7joAvkTEgJ4djMLw3d3PAvoFW5T0JI7gJpkkN92olPGagh4x+qSfhFxwVojXkbYPy3pkE1BBUyo0Ig3XvIiF4LPFpWCulaSxwrLQNhJjH3hDLuGT86wXAJ7Kj/3jrfsFAbxal5F5Dewbrqy69uYg4ww=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&4Z3iXjUo/EHcYSchZnZy5c4jWKFwUgNmLXjd4BPpAHd3B3pUWAdPDaJL/jB58k/c7hNRd360Wv6ql+D6LmzYt/f+7UH56r7nvMjsxlY1k7INPTMUCBSrkaaoXPkFkJe3HROM5xlbb3SWzVH0SJs+111VHoR28dWUnj0NNHKNaYk54nBBW2o4ddkjO2qCfVnRhrubiLllLPkRVwQoWWCziCEm7JxS8ZrBCgLEUqWST96CHpuEcA9V2RBs/fkfiDN0S/Sc1AGmtAi5O7dkX8uiWLk4SaqIf3+TzEOP4hF/2jg=</Encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+GlJuEScEXidUSxTF739QcfM6zFsOSlYxp7s6UXtUNVrKBlqS+54xnoDj9TZIGXORzwNRN+d0RspT87JmRJn1wb5mFXnxgg5cV0pZtPXVLnGrRnaFg79/5ljF2VwHE1y3nHhiPjVJlnMr0Bm6xirfbcpDPjEHlvLKFU0qffhUT02jP0tNAel7mMI/0aLDeJwm4kzfnNEtq03J9I+PxisfSvRgqzTxF+9CacByfdPjbDCVoJJGI8oaR/+BDHfWQZcw==</Encrypted>]]>
    </text>
  </css>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>

    <action id="ByDay">
      <text>
        &ExtensionTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIrLij+h1pylSlIg+PhKoESy1BUXQCY1UaCgbi90ShD2LLDFa7DxoyyaHiUZVa2H4Q==</Encrypted>]]>
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
      <title v="Lấy dữ liệu từ tệp...$Lấy dữ liệu...$150" e="Import Data from File...$Import Data...$150"></title>
      <menuItems>
        <menuItem commandArgument="110">
          <header v="Bổ sung công làm việc cho nhân viên" e="Employee Workday Additional"/>
        </menuItem>
        <menuItem commandArgument="120">
          <header v="-" e="-"/>
        </menuItem>
        <menuItem commandArgument="130">
          <header v="Bổ sung công làm việc cho nhân viên theo thời gian" e="Employee Workday Additional by Day"/>
        </menuItem>
      </menuItems>
    </button>

    <button command="Download">
      <title v="Tải tệp mẫu...$$150" e="Download Template File...$Download Template...$150"/>
      <menuItems>
        <menuItem commandArgument="210">
          <header v="Bổ sung công làm việc cho nhân viên" e="Employee Workday Additional"/>
        </menuItem>
        <menuItem commandArgument="220">
          <header v="-" e="-"/>
        </menuItem>
        <menuItem commandArgument="230">
          <header v="Bổ sung công làm việc cho nhân viên theo thời gian" e="Employee Workday Additional by Day"/>
        </menuItem>
      </menuItems>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>

    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>