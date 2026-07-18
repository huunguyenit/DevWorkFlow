<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "GNApprovalIndicator">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVY/JXGmtY96rZm6+yHDZ45PrjPietnJBdhB9hNL0KF+L5MCWUEhkH5M6Y9RR082TnpOJh8hASSt41XhU4rHFBN8g5/2z0dd/pRnRTZOVYE4iHjgITut5V7A7m34sFXajc0TuZJpYgz+vhc5pSGeb+Fcawto4Xpx83siCeY0ap1rTmIdQgu4gghUjRLGn+b4dJo=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
]>

<grid table="gndmttcttg" code="loai_duyet, u_status" order="loai_duyet, u_status" filter="xtype = 'U'" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo trạng thái duyệt" e="Approval Indicator"></title>
  <subTitle v="Chức năng: %c..." e="Function: %c..."></subTitle>

  <fields>
    <field name="loai_duyet" isPrimaryKey="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="u_status" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã trạng thái duyệt" e="Code"></header>
    </field>
    <field name="u_status_name%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên trạng thái duyệt" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="loai_duyet"/>
      <field name="u_status"/>
      <field name="u_status_name%l"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzkpAAzwx8c2MfpkVGyDlpZaR5c91Np4uBDz/1HSvz4RwlAjJpkxYc2umSKVC5FPDJVWxv/VnxFLmWWn2aJzoXplD4W6X/IUD6LmAzinDuMlzHF/0NuLhlJKJwy7KfhafCT2YHf0MFz0YC7HSkhy6A+A==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL7546jBpjv9xHaTkKG06b7TFN37fe5hOV/z1M2l666rIRFT3O6xlh2DqIK38exGqbcX/+H1af4LWyf9QCoh84Dk0zRqzO3PvvX3u/RKqHFv543</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtfseWNWLICRqU3bdgbYC5r9SLNnkXWrRvbObWerJIqogsRekez7C9I2ZqXRpNT8BkRR34DCwTheo2Fijf6/BKvvIFVfuAvZgSGB7nS5PkjuMOy2JbNLNKbG9VHcbHLt5P47Oc+v+kFpuJrSfVTjO0ReSOUpACOgVR455BAFDeCOqbpTO3cnmJSOwlMdIAtetXOFwqTlEk761Oe2vBOyzxhmDFPNehOOEDFc5y+6vdudp1bbtk8b24JxUghPD3nBzoKHMMhukdE9xavyRyaYQ4qnMNKJVGpdhFzIHlzVl8u43xfd3IAH7zJfWveCwA7WgG15WjoPv7yclJmHtHkQWrlBS8cPHdZHVLhLYWCg0PgjyWoKCW2goYJ87hM2ZkMX5ZjHGpYdZE5Z2YqUEgLkLDNW5JpyISAKXLYWO3MZqLyOX9uz8AxPHlc+c1KrZlEOaud2RABPyS3LNovQCWGUoMLrX8wnSxfohc0/ozIkqekJHmPBkkfi9jAI/4NpL7zFIrdwLoN3krC3ITVjERJShlA8=</Encrypted>]]>
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