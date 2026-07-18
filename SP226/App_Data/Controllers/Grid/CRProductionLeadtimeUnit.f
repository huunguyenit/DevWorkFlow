<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY UnitTag "dmvt">
  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Item;%Control.Unit.Ignore;
  <!ENTITY k "ma_vt">
  <!ENTITY Tag "vcrdmtgsp">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "CRProductionLeadtimeUnit">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVY+pdiWy17C0tt1QlRT91iDCwX98i73Ep1ih4IGB6sG+AKWdBEf6qItFuPxuyT4KQWn0/K+g+UT7uSwZjhPKhG40cxmpumegGlTCNofD5S+riTP+RsHtDL6wbICIZQOxTpLpGcGWFXKU2ihX7PxnrgoHW6eejlerUcySAMAZM7vqLqrvDdhwSTHysFuySW0MNJEB5+BfGmNS8j5fFXy7xpPXxSZb7XiDu6d3Q/Nub57gA==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
]>

<grid table="vcrdmtgsp" code="ma_vt, ngay_hl" order="ma_vt, ngay_hl" filter="&UnitFilter;" initialize="&UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Định mức thời gian sản xuất sản phẩm" e="Processing Time per Unit"></title>
  <subTitle v="Cập nhật định mức thời gian sản xuất sản phẩm: thêm, sửa, xóa..." e="Add, Edit, Delete Processing Time per Unit..."></subTitle>
  <fields>
    <field name="ma_vt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã sản phẩm" e="Product Code"></header>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Hiệu lực từ" e="Effective Start"></header>
    </field>
    <field name="dvt" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị tính" e="UOM"></header>
    </field>
    <field name="cong_suat" type="Decimal" dataFormatString="@CapacityNumberViewFormat" width="100" align="right" allowSorting="true" allowFilter="true">
      <header v="Định mức thời gian" e="Proc. Time per Unit"></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="cong_suat"/>
      <field name="ngay_hl"/>
      <field name="dvt"/>
    </view>
  </views>

  <commands>

    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibMbgBKX+0XSN0QTXpyMAdpCBOrXc7tBA0FETyg/t6ghjP1Y8g+UlhsLjlObvBuXORFG8odd5gVk3f9ed8QU8EuXulDdMuQikvhFbODep0pQsYG0Uc5wyOsViPPPRbxbgEvLvXxSbRaxfI05VBhAFrKz0FgGa/2SlrQOl1d9L4+zjWKDsD3i8RIU1o6VhqHZe8+VsynMSbWt4XstZBppekyh7JfxiXp1taAe076Kg/OQwMIeRBeDtgQXZOOD6pE+DhEv8D68NY8pEp7FsDpCY1s+mQq/d+Sb+WB4h6QjaTV2MnbXs2Cs7PEFgOO8+/oW22Y0oepc1kZIMcFmxjPpEOWsi28gvj6/lU43Q6RjCplMdPB/Sbzjc0WIRBbi4/1eKugeIXTRBEFSuH4+JfW/uWVbHo0gvXUenn6EiXfVV/bk=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFEbFcrbcv/VBx80l7eJ0wLIOiCQjMtuZ5KBpyQzN/prAHam+Ox+khcIRg++3QXVpvb1RkQiglUHWz8kaMVGuBgvLk8KjAsyw4YjVn38/ktH</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtZKt3pEvydC6H+fWd/YB4anz6UCME4u2Hleu3YLVRmR1JRjRagGpuMd/hprSIZvsRCrZ1hI9ZDN02HyQdSXe86tXkPEFhJa40HIZ+RtWXQRPwgXdHjhFd8T1JjtkCB3+MHeCR7UU7cufbwQYKLTN8y0oa9IwgI6KnsxEtOTRvrz490KW5s3YJ/P0Kp77zEZRLHzOpVVmTHCbpwPVzLjwg/KcBu+32LOeVk8tDQrPLT/ggy++kdhtTSzgPAgrSWn7brQ2QXqJMasLJ8LCtQyFhYXZdQsMTTqYgiVKus95E2pHc04Lim/gcyaUT7Xskz8vSidEoB30cOIQxs8V/1+kWXHSmU2ZiLLr5/EocpN1VWveSVMrno9nvmu2pP3R9ITeew39uUTHHiFXc0EAN9XTpLvmsFc1d07HjTBkxdpMKNftniFcwYPw7Im66Oi1zzTePNyitG6ao2GL/KDows1Tb8riuSPXYlSuDyNFrpk+L1JqnWtLVnQV9tqYqGNXG7++UXGLKDM1URpXlLEfjH7tO13Vg5kiyFqtHNpJijwXPnv5wU6VNhKSoZTUrv9DCEQhtg==</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6HxhnS8rGXsILZQU7MG6tihTqkxU1cqCt+DhMnIAxvtuQ+N4njb0Oj78FsWbACiwY0eFsvcoRfLaSehrnSJgblNHEz3mPXV3lJiZ+zCxACf3q9rqIhJSnMgGKH0wHHa1vPx+cmxP/MJ/jk2YooHHzimtlF4eAlV+Z5xXReeoMEzxSAsQ6k39useeGGZaMu5yY/nfbnh3UA4aK1jVUyW3HeMd9VNDF3MDeNtiOFpQml3hHGDyIcfDG3sA83+LNzMsw==</Encrypted>]]>
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
    <button command="Generate">
      <title v="Tạo định mức tự động$$90" e="Auto Generate Processing Time per Unit$$90"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>