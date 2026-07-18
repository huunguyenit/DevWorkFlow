<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckRight "(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "hrInsuranceInformationChangesInput">
  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVYbZV1N4PfNit36lcXodoB4dXC0Pf+z7ALIquz3kKIozZXwHotBbgCKod4kRWvVAZ89nbeg/0AgbJDpxfkRPk92c/4bFhQDSTApZGoJAC5gNA7eoburk2s9Gj1iRyTp+oWkMkPrYKuHUfPD9/lgZApYSVO/Uy6Kb7uhv3YZZQQPIU32GNU5Cs9Tvyov2Co3uepVl6aFkIMUWPpO6wryTCWxIM3TzKvhGwNasDGIceq883W2a7fbMW22FcuUhuWZyWQ=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vhrbhdstg" code="nam, ky, dot, stt_rec, loai_thay_doi, ngay_thay_doi" order="nam, ky, dot, ma_nv, loai_thay_doi, ngay_thay_doi" filter="&FilterCheckRight;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật danh sách lao động tham gia bảo hiểm" e="Insurance Information Changes Input"></title>
  <subTitle v="Cập nhật danh sách lao động tham gia bảo hiểm: thêm, sửa, xóa..." e="Add, Edit, Delete Insurance Information Changes Input..."></subTitle>

  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" width="0" hidden="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ky" isPrimaryKey="true" type="Decimal" dataFormatString="#0" width="0" hidden="true">
      <header v="Tháng" e="Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="dot" isPrimaryKey="true" type="Int16" dataFormatString="#0" width="60" allowFilter="&GridListAllowFilter.Number;">
      <header v="Đợt" e="Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_nv" width="100" allowFilter="&GridListAllowFilter.Column;">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" width="150" allowFilter="&GridListAllowFilter.Column;">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="loai_thay_doi" isPrimaryKey="true" width="100" allowFilter="&GridListAllowFilter.Column;">
      <header v="Loại" e="Type"></header>
    </field>
    <field name="ten_loai%l" width="150" allowFilter="&GridListAllowFilter.Column;">
      <header v="Tên loại" e="Type Name"></header>
    </field>
    <field name="ngay_thay_doi" type="DateTime" isPrimaryKey="true" dataFormatString="@datetimeFormat" width="100" allowFilter="&GridListAllowFilter.Column;">
      <header v="Ngày thay đổi" e="Change Date"></header>
    </field>

    <field name="hs_luong_cb0" type="Decimal" allowFilter="&GridListAllowFilter.Number;" width="100" dataFormatString="### ### ### ###.000" align ="right">
      <header v="Hs lương cb cũ" e="Old Coefficient"></header>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_cv0" type="Decimal" allowFilter="&GridListAllowFilter.Number;" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right">
      <header v="Phụ cấp cv cũ" e="Pos. Allow."></header>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_vuot0" type="Decimal" allowFilter="&GridListAllowFilter.Number;" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right">
      <header v="Phụ cấp vk cũ" e="Off-scale Allow."></header>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_tn0" type="Decimal" allowFilter="&GridListAllowFilter.Number;" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right">
      <header v="Phụ cấp tn cũ" e="Seniority Allow."></header>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_kv0" type="Decimal" allowFilter="&GridListAllowFilter.Number;" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right">
      <header v="Phụ cấp kv cũ" e="Region Allow."></header>
      <items style="Numeric"/>
    </field>
    <field name="luong0" type="Decimal" allowFilter="&GridListAllowFilter.Number;" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right">
      <header v="Lương cũ" e="Old Salary"></header>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_lg0" type="Decimal" allowFilter="&GridListAllowFilter.Number;" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right">
      <header v="Phụ cấp lương cũ" e="Old Allowances"></header>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_khac0" type="Decimal" allowFilter="&GridListAllowFilter.Number;" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right">
      <header v="Các khoản bổ sung cũ" e="Old Additional Payment"></header>
      <items style="Numeric"/>
    </field>
    <field name="luong_cb0" type="Decimal" allowFilter="&GridListAllowFilter.Number;" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right">
      <header v="Mức đóng cũ" e="Old Sum of Payment"></header>
      <items style="Numeric"/>
    </field>

    <field name="hs_luong_cb" type="Decimal" allowFilter="&GridListAllowFilter.Number;" dataFormatString="### ### ### ###.000" width="100" align ="right">
      <header v="Hs lương cb mới" e="New Coefficient"></header>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_cv" type="Decimal" allowFilter="&GridListAllowFilter.Number;" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right">
      <header v="Phụ cấp cv mới" e="Pos. Allow."></header>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_vuot" type="Decimal" allowFilter="&GridListAllowFilter.Number;" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right">
      <header v="Phụ cấp vk mới" e="Off-scale Allow."></header>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_tn" type="Decimal" allowFilter="&GridListAllowFilter.Number;" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right">
      <header v="Phụ cấp tn mới" e="Seniority Allow."></header>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_kv" type="Decimal" allowFilter="&GridListAllowFilter.Number;" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right">
      <header v="Phụ cấp kv mới" e="Region Allow."></header>
      <items style="Numeric"/>
    </field>
    <field name="luong" type="Decimal" allowFilter="&GridListAllowFilter.Number;" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right">
      <header v="Lương mới" e="New Salary"></header>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_lg" type="Decimal" allowFilter="&GridListAllowFilter.Number;" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right">
      <header v="Phụ cấp lương mới" e="New Allowances"></header>
      <items style="Numeric"/>
    </field>
    <field name="phu_cap_khac" type="Decimal" allowFilter="&GridListAllowFilter.Number;" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right">
      <header v="Các khoản bổ sung mới" e="New Additional Payment"></header>
      <items style="Numeric"/>
    </field>
    <field name="luong_cb" type="Decimal" allowFilter="&GridListAllowFilter.Number;" dataFormatString="@generalCurrencyAmountViewFormat" width="120" align ="right">
      <header v="Mức đóng mới" e="New Sum of Payment"></header>
      <items style="Numeric"/>
    </field>

    <field name="tl_xh_tang" type="Decimal" allowFilter="&GridListAllowFilter.Number;" width="100" dataFormatString="#0.00" align="right">
      <header v="Tl BHXH tăng" e="SI Incr. Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_yt_tang" type="Decimal" allowFilter="&GridListAllowFilter.Number;" width="100" dataFormatString="#0.00" align="right">
      <header v="Tl BHYT tăng" e="HI Incr. Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_tn_tang" type="Decimal" allowFilter="&GridListAllowFilter.Number;" width="100" dataFormatString="#0.00" align="right">
      <header v="Tl BHTN tăng" e="UI Incr. Rate"></header>
      <items style="Numeric"/>
    </field>

    <field name="tl_xh_giam" type="Decimal" allowFilter="&GridListAllowFilter.Number;" width="100" dataFormatString="#0.00" align="right">
      <header v="Tl BHXH giảm" e="SI Decr. Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_yt_giam" type="Decimal" allowFilter="&GridListAllowFilter.Number;" width="100" dataFormatString="#0.00" align="right">
      <header v="Tl BHYT giảm" e="HI Decr. Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_tn_giam" type="Decimal" allowFilter="&GridListAllowFilter.Number;" width="100" dataFormatString="#0.00" align="right">
      <header v="Tl BHTN giảm" e="UI Decr. Rate"></header>
      <items style="Numeric"/>
    </field>

    <field name="tt_cu" width="150" allowFilter="&GridListAllowFilter.Column;">
      <header v="Thông tin cũ" e="Old Information"></header>
    </field>

    <field name="tt_moi" width="150" allowFilter="&GridListAllowFilter.Column;">
      <header v="Thông tin mới" e="New Information"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ky"/>
      <field name="dot"/>
      <field name="stt_rec"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>

      <field name="loai_thay_doi"/>
      <field name="ten_loai%l"/>
      <field name="ngay_thay_doi"/>
      <field name="hs_luong_cb0"/>
      <field name="phu_cap_cv0"/>
      <field name="phu_cap_vuot0"/>
      <field name="phu_cap_tn0"/>
      <field name="phu_cap_kv0"/>
      <field name="luong0"/>
      <field name="phu_cap_lg0"/>
      <field name="phu_cap_khac0"/>
      <field name="luong_cb0"/>

      <field name="hs_luong_cb"/>
      <field name="phu_cap_cv"/>
      <field name="phu_cap_vuot"/>
      <field name="phu_cap_tn"/>
      <field name="phu_cap_kv"/>
      <field name="luong"/>
      <field name="phu_cap_lg"/>
      <field name="phu_cap_khac"/>
      <field name="luong_cb"/>

      <field name="tl_xh_tang"/>
      <field name="tl_yt_tang"/>
      <field name="tl_tn_tang"/>

      <field name="tl_xh_giam"/>
      <field name="tl_yt_giam"/>
      <field name="tl_tn_giam"/>

      <field name="tt_cu"/>
      <field name="tt_moi"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758MDxOdugL5okNOa7/KzmZ3ee/JD7KSMnchVkkfOAnB3koFo3Hnmqn9MPdHFa0hldohySB/MasyS8AEnROajeNav3KPnYfwM3kRiMf5ZVeimoDfKfhlacyuht9z5q5fJNCEwA7h5VTkRuA+iE0sr5DGd5a6FsvH6crKbNpCGegPivuUaN1kPXHtH0l8KfnRSN52OojkN+cq3k7L3hPA54ujkkNjcGD+Tf6sy6OrZfEsJr42NxgWrcro54UsIEnuKf1raODDzxmSJQm17bJhT4X0=</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75+Snc6y3l4ObhtG+C7RqGLJpj9JN1VC1Z6EDLyTmUHNy1F5km8X9dSqRBqW49C70fcXBcj5HdtYssZ9xiejJNeXEkMeu3b2ESaXJu27evx4L</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtWv1DUG4hHZYtPguXDcd6bC2ZaW0YcxYjl/vVjyy7XljJLCKy+Bxb1qLrQeyjoa7pXZAqqSWKnN1cTEUeDFnyWvlGh8a3mJ3y5kckrFAJrUIK/Fi5Eu/dbRRCCtN9GVSHW/KQ2ybcUdEruvZOiApf9dkk4aI/nFlgTDkQeALtZuzGCo6E7pbvK1MeMl8qEmjccTP2BD54XsgNRsA9oveT8+bP2qjcZroQWo6oYKq5sT9Xxr5UzMZy+gjjdPzRSuuIjfCo1dGfb50T98kltqey3r3zVopvLk689loZjuP1td6xbqLxSoLBlDs50LzInehH5ptj8Ccc072qYZRY2tog2nDb3+nIlyub7jEDQRgii7uMLe5G8UBx7fgeDfMf/sINe6OFVOJI0bXQp/ZF3noHPBViiiFw3o5u9BsDiQ7rO04+D0qaoyk8EqI1n/lSEejA44bqbHq7MCs6AFcq0qN9mmQHf7pUftyyjqX6go0T3UodIJu8bejL0OnjEtM4kMDjqUAdQzl5T4sU3YobHmI73RA/6RYD+chgR4EoQvtQBgU8dn/A8Ue2wWsHjzkQdCkZ/IxCvV+5gwk7tIk0Ax8a+WqNM2hmJLWLYIQM6reH0gIAt4Flk+mMp3fF49ebS9uBQ==</Encrypted>]]>
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
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Retrieve">
      <title v="Toolbar.Retrieve" e="Toolbar.Retrieve"></title>
    </button>

    <button command="Separate">
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
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>

</grid>