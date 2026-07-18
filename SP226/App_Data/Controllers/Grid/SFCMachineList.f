<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "SFCMachineList">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVZ3tq2cCB7LQ69U+TcsKzJYa2OK7ivW7DJQqsQ8x2S3K7OQQf1ImS69bMLnVCDuxUAKieAN4L8V544c4rY1wUcvjeh2imsDjzHMwFXyYN5d6/o4AmTk6RMZF7vHNDIbraj6+C+XbQxtrV2v4Q5VnoRKNZbJecJc30dXa1p2ZFHiaQ==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
]>
<grid table="sfdmmay" code="ma_may" order="ma_may" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục máy" e="Machine List"></title>
  <subTitle v="Cập nhật máy: thêm, sửa, xóa..." e="Add, Edit, Delete Machine..."></subTitle>
  <fields>
    <field name="ma_may" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã máy" e="Machine Code"></header>
    </field>
    <field name="ten_may%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên máy" e="Description"></header>
    </field>
    <field name="ma_cm" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã cụm máy" e="Machine Center"></header>
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
    <field name="cong_suat" type="Decimal" dataFormatString="@CapacityNumberViewFormat" width="100" align="right" allowSorting="true" allowFilter="true">
      <header v="Công suất" e="Capacity"></header>
      <items style="Numeric"></items>
    </field>
    <field name="toi_han" width="80" align="right" allowSorting="true" allowFilter="true">
      <header v="Công suất giới hạn" e="Critical Resource"></header>
    </field>
    <field name="nang_suat" type="Decimal" dataFormatString="@CapacityNumberViewFormat" width="100" align="right" allowSorting="true" allowFilter="true">
      <header v="Năng suất" e="Efficiency"></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_may"/>
      <field name="ten_may%l"/>
      <field name="ma_cm"/>
      <field name="cp_tt"/>
      <field name="tk_cptt"/>
      <field name="cp_gt"/>
      <field name="tk_cpgt"/>
      <field name="cp_ql"/>
      <field name="tk_cpql"/>
      <field name="cp_dv"/>
      <field name="cong_suat"/>
      <field name="toi_han"/>
      <field name="nang_suat"/>
    </view>
  </views>

  <commands>

    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibMbgBKX+0XSN0QTXpyMAdpCBOrXc7tBA0FETyg/t6ghjP1Y8g+UlhsLjlObvBuXORFG8odd5gVk3f9ed8QU8EuXulDdMuQikvhFbODep0pQz77/aFBs2DXDgMaS9pYV+5MjUNb6WlN4x6Fu8Clmm6NlRhUvovXQW5m9r6SwrXSNWzXM0DPhZolR2OrqboING2KbXqvFOfyEzSOMKu3cE86m+VTCp9Dfu713W9CVXokGT0spPkRjyN4jAmjfJfkJRn32KHpDIKMCfJ2XfN7uL9bs3l0emTJZGJIKwA7RAu+uAjy35tMvrQBN0QcQ2kPHkc6Xcyc6fYybfSvX0JftV5hkSMF1riQvWiA7slb8jcezPGlEKl7QbBpkGDrDWiP/prSue/VPPsyXhmrlDbC/zkWWl/zs2h5YOx/dOC+kVcqk=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcG8PJkXTolyVU1cDSbfH1emDa/TWmOzuER2qWixoXJidEWCsYDMXzW9+MEgAzxITQAdwkXDzZ52VPJBQ+UUS7ltVDBkmeX5bnU5jxQsU/NvL</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtZk/JVOhU14AQ2H+dvgLwMB0FV2RFWIf4Yvd9glOdH9SzZ08j8+ziai45Uw9xAYH+76YZhqB6qEeBByffD+/bHexOLSF6BsZS1EpI3AsmzrjdCY5UUW7tNl+5nM/HJxriU5WHPWIeu+x24LGk+Yb0mptQtVnHicl6cthGKJoaUoui4xPRhulpJ8ATs1HpscCCB/s+9ToWA/nSBZOMuAb3e5juUW2Q8MgbpjDNopZBehqDL2/3jNn9NwHINBoajQTpbJBCNSRITsNUpAimT0QyozoGIqg3xEGV9+l+yXSKpOmale3I4TcofnMNKYFJBD+IJ81E/tBmjkitlhT08AVoc62mNO5NSIb0/H1AgqbHG6/VhMTHcu6xCDIEuTGI/HlR6LyaURE+zljpp5H0eLd0W1aWpmP3Xqgp/sjENeIBNEd/2hNEL6LY3hOQmEHn/YNABYauhHMpFN7kN4XOt40umhDYLgGEfoQBRpPBgU9N6cTj2Zx3FBuaE6jW/2bXx8Vc02MHQS2oIehVf8X6T/e3BlTisXHmnKPIJEeyP4M1rBy</Encrypted>]]>
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