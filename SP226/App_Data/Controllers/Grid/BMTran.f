<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "BMTran">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVa7JcStuNiTDfvrX1/qYdXlmjDy+Mnb0I22KAPjh8jsZqm/4BJGSugesZ+vmLfgc82n0nLSbfOOLEPw+esxIuAIPP79648Fm4J8z3KUWMwadxI3gqNhoOCFWMLiL5sTjxuG39KttKXmV6jjEmV0DMCIIlrs69a/1Ol5UHZtb26Jisz4cL5OTbi9vCfApMA0Gus=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Product;
  %Control.Unit.Ignore;

  <!ENTITY k "ma_vt">
  <!ENTITY Tag "dmvt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="phdm" code="stt_rec" order="ma_sp" type="Voucher" id="DM1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Định mức nguyên vật liệu" e="Bill of Materials"></title>
  <subTitle v="Cập nhật: thêm, sửa, xóa..." e="Add New, Edit, Delete Voucher..."></subTitle>
  <partition table="phdm" prime="phdm" inquiry="idm" field="" expression="''" increase="" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_sp" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã sản phẩm" e="Product Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_vt%l" width="300" external="true" aliasName="b" clientDefault="Default" defaultValue="''" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tên sản phẩm" e="Product Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="dvt" width="50" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Đvt" e="UOM"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_bp" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã bộ phận" e="Department"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_bp%l" width="300" external="true" aliasName="c" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tên bộ phận" e="Description"></header>
      <query>&InsertCommandFilter;</query>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_sp"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        &CommandWhenVoucherBeforeInit;
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL7551ghWPVjLWYEdddqNE4n+8pPX5mbn4cTOev3sg2S0/Va5KjBXN5zdsbzhIZinRa1UnUYRBwaqpF29BB3Eih18B+fFPqcH4pys9ttI+GbqAiiL5qfNd67h1gTbeZVMeoYaybnngsyyMoSzbi6sM1oP9Q10Xt1T19G6aJ3zEmDufanyW/ZDD7Pf4CZA3mIir5PR5xBIlB6f2hXlNJjetJ/eNT4TrwXW9G3nXKdpIK4Nnw</Encrypted>]]>
        &CommandWhenVoucherAfterInit;
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGtoRsGxYkOOVrszfyhmmp7NIDuoSPW9f2YCjlltw5lDkiSGiSJt74V8jSLcsWaa74dLRwy42EdPtwEJNco5od+wAByUyIuaHGLl66kL1qOGV3INhBQjblYVZaOjzA+NlxyCw9ZSOKH7Nc1BEU7arJXPh5z/2EmC4SJ+RmYje9Wn6ED5MdNuhUdB33srQRYmtbJn35PVopk27l+HUMRTyoSujdF7jl4zD3jvSAKwx1HZHa3OHPUyHRXm8SxC7ECWO87nnEMCahDlsb03RVpW1yuJjjEp5h1vqQJzTlmkT8475uZne2QfRxjNmIxYM2mFJ+21WrOvyD3rX+5bOgSpESK0qOukpEGTrHYP4Lklmub9kNdm0MAC3NdkgXO0NPLW3FbJJWNwrbgK+9Q+xPZM0OHxtECp7r4IVE6ylxLRJWNecvnVU/2GL8Ti5QGj7If1fkkDwyxG0zsVfoC9qLR01hdxp8hXOp+9+zkme0OJsQhduzoaTdop5/qdYS5ohZb7dI8fRHjys7VyjK9S58GrpxqG7KqyvFkO/ujhaaANMx2P8DJEhYLVm6o3L4LDhhzuvVuypBmzchoRwwf7Jci7WAiHi1/kJqD12Wk3rvJ5WavTnFZpB4K2ZX6GptvUPDEmC78J0uNwgspWmXo/VMzSUPmBHO0wiXeHNEeOviTKm9hRk7J9Q6vrS4huHjbH2grHSBr7z4zVg3E7KLxSEpi5UUnH6rPwAR0EWeCXZpJ4aHOPbLkOABQxpWoZYMbTOoZo1Pz2vy08nWurE5UZTvJCpMe0GStPxwYoBe6az+Tp8YiXoXuKAJeYF6t2KNnB8VtREfA+WtjMwx8k9Wb3rhNMkH+9n7fgL6Bk4MutJwggBK/CbTH/t1CBu2UML/gOnG8JWX8ZTV4bF2gPZMU4WQ+Y7X48LkZUGC3nBaN/1sij6RdV+1jZSBTsE2tMbszFNLRnnnArolafwAOwFDIXZ23CTEO2</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>

    <action id="GetBOMView">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6eKWlrqbEHgOEtl+nt21pFmVjsMJz0jUBVKc8as3qEBfjcDb5ncIkGom0RN/JhLtaorbc/5em1bkSU+8QfHQ0hq/0ZQ0JJnc/9g6J9qmEVwFFl+IuRf6Ss3Rzy9S01EnKo/XIkkvTy22i7LYlKROCeNeqJdMLXWmb28QrLwPbuZ0YEEgXjmkzuBUtXQSGCKl5cFpfJkRTBav9oGN1sR3EjaGPhD9x7W7Xkns7p/CFP6/6lgKQKvEx4P6kXxPT+iJwG9kdZ/lUH1ueLGzgnmEx6ezTUFfKhBpaduoHtWYqB5FQxifk+eIpPPMZW2EMATAlij3TAnO4a9UdyVOXbSpizYG/I1Olf4/0om48dYVhVCuSZnBksqvhhw6Wekw0D7aA9cBVLn1rJcCwTtgan2BaarXK7vg8r1s2+F2JvCQNaPwJw2aCMgPBRDpjamaiYa4usAeEwOJLc76rGPdGZC4g6mYy48XilGRY1zQ9fAT3fnteXXMiS91D0RmnSesezrcEvfRFNBw+8ZQrAeKDJ3sSLX+665xo2baP2R79Pats4Zo6glIsAmE/GnWNxRt9qHdDCNHnf6+2E5TyLuCk9yCiswMRrizsK/STmFEpstLzc3UFivnc4qv68mbiKwlR/JVz1Ui3xJrIOfcIw6NpmC5qQXWHLPn5Tfq86zGpYoDDxT+P7B/IvddvoqsUzacN5rqwyIQnTRDIg6vGMH5JAWBnO2BQBkZpOFzdeKYPWOgGUsBNyzxpEP9U6Aztnc0bo1wTBPBpQsx//zemisY9SWQ7Ga/Gq5Sx7UClo4YJaYmegZhdibVZd3sHj4qRmDxtg6VQv5WaND8+CSWkab5xs7oRL95vD3Y9j2qY6k4u+W9YIrotnNCZrGkrBunw1dITmsAnqf8nxpGIyxKaMHUw1OzWxzgFLxBy7lkhaHP88T6l0Nco5SojEuXNZex6tiFD5OpUpqu4ReXfB05tNZlW9nIqhlsx1T21QDdmMpGuuKW9LaXVU0L+ApM68t/YSDVX6xmp7n6YZcd4u6DfvIroqpNebDBUm09JpNnjyQ+WGkiWXwm3sDqqzIWv1yzRtR/PHmmb5CZSmN80F4v1VyVajxJfRaTGmagPKYEil5O90h1+rTVWm6Y1zVP3B/l9QQeOb10mwiKuy7BzFMYGRz+iOy6/z+JjOkIVj4tADnKtozjqjnvFsnUHQvWthm43BiCk4zHw==</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        &Conditional.Control.Unit.Product.Query;
        <![CDATA[<Encrypted>&sp4+hMHegg2EZffLn/pV+x2nS9ge74ui3KuefVaaWmeJcnbKQMmv0K6/Mhm9BS9w8PLJ3Se3soUdz402YYQrEUWODS4CGpwFay85/zLGUzE=</Encrypted>]]>&Conditional.Control.Unit.Product.Source;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPgQdnbgxSpujs8svHbfF3qR2jTiUt15LAi13/vVg7yI</Encrypted>]]>&Conditional.Control.Unit.Product.Alias;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssSHyCuWQdmLNZRf19Z2Va00RpmQ9I6HjIsLf2HaeD04qsWWsXy9F+2ktfEiW7Rm4K/i0lrEDf7j55rRfAv5IDpFnk6gGGuOQO4CpyalpVIdfH4DyCzVW7qzs3aGnOnsS4jjYaRxBus0AOhcrpBBUCudK8quw9Zu2yvki+w2qgqTP3UiZBPxO4hTb8C01HTgZyNRMWRHnfuklmib/ddoSP4GHPAH1z6VwzktID8Xos7/BWK4ZEo+eTjUbdlreRy/GvA=</Encrypted>]]>&Conditional.Control.Unit.Product.Parameters;&Conditional.Control.Unit.Product.Variable;
      </text>
    </query>

    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssRnq9m+Yg+ZVIAkTEZCcTnRdbJcEN1Yk6IKN1GV29+NECWQi28XuJPDBAafzN2MWRl30Dbe6jP6XCCGHAHCmDNQY/czg6USozB6aORQcDLqnHgunAwjtzGZAXsPT4eztuzzPF0th+DACVFmrfSxM4GoDlBM3SFmIVt8dsReB9iT/ts57Wckl8kSJPVRFkHI5k7fRNmnULt/VstVW9jhGVfN6E5W9W/kWbVvn7xRp5f4V4QuGuaGTrLDdseE4btTLleCKvafZzOwnjjW5kF/LHzWej1oaSiK3BdaRRkf6XF1TdjtmB4yjWqkoN/TWtJSaWc8H0Y2kck0Q5Yl3euIi9OltkQZYM4dhuSc47Y0pm2IPChG4tCcqvTsFmcuUizQLAg=</Encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+avxtQ58FqDl+auj1EQWwj5+UQYZGMBPxyUVV1SIhbbxhtDaqqP81CKM6bio+bSOOm1YhuKOVqLWY1NilxpoRp3m13FmZDFVZiAX4xIyfyXC9ER7n4RKKtYYHvA6oI0JcHYdwPMoF8dbSz6gWD6CHdZTrBi28AcocDzYs58Rsp6DQ==</Encrypted>]]>
    </text>
  </css>

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

    <button command="Clone">
      <title v="Toolbar.Copy" e="Toolbar.Copy"></title>
    </button>

    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
    </button>

    <button command="GetBOMView">
      <title v="Cấu trúc nguyên vật liệu$Cấu trúc...$90" e="Product Structure$$120"></title>
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

    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>