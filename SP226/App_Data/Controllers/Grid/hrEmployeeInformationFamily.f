<?xml version="1.0" encoding="utf-8"?>

<grid table="hrhgd" code="stt_rec, stt_rec0" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""/>
  <subTitle v="" e=""/>
  <partition table="hrhgd" prime="hrhgd" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="ho_ten" allowNulls="false" width="150">
      <header v="Họ và tên" e="Full Name"></header>
    </field>
    <field name="ma_so_bhxh" width="100" dataFormatString="@upperCaseFormat">
      <header v="Mã số BHXH" e="SI No."></header>
      <items style="Mask"></items>
    </field>
    <field name="si_so" width="100" dataFormatString="@upperCaseFormat">
      <header v="Số sổ BHXH" e="SI Book No."></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_sinh" type="DateTime" width="100" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày sinh" e="Date of Birth"></header>
    </field>

    <field name="ma_tinh" width="100" aliasName="a">
      <header v="Tỉnh/thành (khai sinh)" e="Province/City (Birth Certificate)"></header>
      <items style="AutoComplete" controller="hrProvinceCity" reference="ten_tinh_thanh%l" key="status ='1'" check="1=1" information="ma_tinh$hrdmtinh.ten_tinh%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Evk2ECS913V/z1gUExNTVACdOL3dTa7odw2Rk2B93FFa089a5Aj6CaUfMLsW0pJiA==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_tinh_thanh%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_quan" width="100" aliasName="a">
      <header v="Quận/huyện (khai sinh)" e="District (Birth Certificate)"></header>
      <items style="AutoComplete" controller="hrDistrict" reference="ten_quan%l" key="ma_tinh = '{$%c$%r.[ma_tinh]}' and status = '1'" check="ma_tinh = '{$%c$%r.[ma_tinh]}'" information="ma_quan$hrdmquan.ten_quan%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PmAa65Rx5chNls0cOySJHzO+uLPijoiqxnHXWoTogz5KmR9z2Jzz9/XgJKet4FxhA==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_quan%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_phuong" width="100" aliasName="a">
      <header v="Xã/phường (khai sinh)" e="Ward/Commune (Birth Certificate)"></header>
      <items style="AutoComplete" controller="hrWardCommune" reference="ten_phuong%l" key="ma_tinh = '{$%c$%r.[ma_tinh]}' and ma_quan = '{$%c$%r.[ma_quan]}' and status ='1'" check="ma_tinh = '{$%c$%r.[ma_tinh]}' and ma_quan = '{$%c$%r.[ma_quan]}'" information="ma_phuong$hrdmphuong.ten_phuong%l"/>
    </field>
    <field name="ten_phuong%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="gioi_tinh" width="60" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Nam/Nữ (1,2)" e="Male/Female (1,2)"></header>
      <items style="Mask"></items>
    </field>

    <field name="ma_qh" width="100">
      <header v="Quan hệ" e="Relationship"></header>
      <items style="AutoComplete" controller="hrRelation" reference="ten_qh%l" key="status ='1'" check="1=1" information="ma_qh$hrdmqhgd.ten_qh%l"/>
    </field>
    <field name="ten_qh%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="cmnd_so" width="100">
      <header v="Số CMND" e="Identity Number"></header>
    </field>
    <field name="chu_ho" type="Boolean" width="50">
      <header v="Chủ hộ" e="Householder"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99EHd9trl+AOBLgfqqFE9FvOlkYt+vk8jUA70YsjgkgTtgk8Ro34kv1/egZEssROAog==</Encrypted>]]></clientScript>
    </field>
    <field name="loai_so" width="100">
      <header v="Loại sổ" e="Type of Resident Status"></header>
      <handle key="[chu_ho]"/>
    </field>
    <field name="ho_khau_so" width="100">
      <header v="Số hộ khẩu" e="Resident Registration Book ID"></header>
      <handle key="[chu_ho]"/>
    </field>
    <field name="dia_chi" width="300">
      <header v="Địa chỉ" e="Address"></header>
      <handle key="[chu_ho]"/>
    </field>

    <field name="ho_khau_tinh" width="100" aliasName="a">
      <header v="Tỉnh/thành (hộ khẩu)" e="Province/City (Resident Registration Book)"></header>
      <items style="AutoComplete" controller="hrProvinceCity" reference="ho_khau_ten_tinh_thanh%l" key="status ='1'" check="1=1" information="ma_tinh$hrdmtinh.ten_tinh%l"/>
      <handle key="[chu_ho]"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Evk2ECS913V/z1gUExNTVCPL5bB5I3qM1EObPFlUqKPwwZv3uSSE09mOhOySTsAdw==</Encrypted>]]></clientScript>
    </field>
    <field name="ho_khau_ten_tinh_thanh%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ho_khau_quan" width="100" aliasName="a">
      <header v="Quận/huyện (hộ khẩu)" e="District (Resident Registration Book)"></header>
      <items style="AutoComplete" controller="hrDistrict" reference="ho_khau_ten_quan%l" key="ma_tinh = '{$%c$%r.[ho_khau_tinh]}' and status = '1'" check="ma_tinh = '{$%c$%r.[ho_khau_tinh]}'" information="ma_quan$hrdmquan.ten_quan%l"/>
      <handle key="[chu_ho]"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PmAa65Rx5chNls0cOySJHySEzS5pHLamq6YK8F9Bd1cJpSWSp7ClXFgwppyGIjSeA==</Encrypted>]]></clientScript>
    </field>
    <field name="ho_khau_ten_quan%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ho_khau_phuong" width="100" aliasName="a">
      <header v="Xã/phường (hộ khẩu)" e="Ward/Commune (Resident Registration Book)"></header>
      <items style="AutoComplete" controller="hrWardCommune" reference="ho_khau_ten_phuong%l" key="ma_tinh = '{$%c$%r.[ho_khau_tinh]}' and ma_quan = '{$%c$%r.[ho_khau_quan]}' and status ='1'" check="ma_tinh = '{$%c$%r.[ho_khau_tinh]}' and ma_quan = '{$%c$%r.[ho_khau_quan]}'" information="ma_phuong$hrdmphuong.ten_phuong%l"/>
      <handle key="[chu_ho]"/>
    </field>
    <field name="ho_khau_ten_phuong%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="dien_thoai" width="100">
      <header v="Điện thoại" e="Phone No."></header>
      <handle key="[chu_ho]"/>
    </field>
    <field name="ghi_chu" width="300">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec_nv" readOnly="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ho_ten"/>
      <field name="ma_so_bhxh"/>
      <field name="si_so"/>
      <field name="ngay_sinh"/>
      <field name="ma_tinh"/>
      <field name="ten_tinh_thanh%l"/>
      <field name="ma_quan"/>
      <field name="ten_quan%l"/>
      <field name="ma_phuong"/>
      <field name="ten_phuong%l"/>
      <field name="gioi_tinh"/>
      <field name="ma_qh"/>
      <field name="ten_qh%l"/>
      <field name="cmnd_so"/>
      <field name="chu_ho"/>
      <field name="loai_so"/>
      <field name="ho_khau_so"/>
      <field name="dia_chi"/>
      <field name="ho_khau_tinh"/>
      <field name="ho_khau_ten_tinh_thanh%l"/>
      <field name="ho_khau_quan"/>
      <field name="ho_khau_ten_quan%l"/>
      <field name="ho_khau_phuong"/>
      <field name="ho_khau_ten_phuong%l"/>
      <field name="dien_thoai"/>
      <field name="ghi_chu"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
      <field name="stt_rec_nv"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75+bVSAvuw1zCdtf5BDm6IqlmcBOZIf8oAx25XCmg4ziyuXF+RcXPh938S3nWDgjBl6Ls/aybGlkepnoteYWvOsKwwTNOkQ9ZUKRcDLkcV5L+</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL757ojoTO5yFdm//m4F4rXw8l1zqzzz3ztYZUaAV2V1AMdpLnjcugup4fIB2GEGwze3gYHP3wRzQHP99s5N0gj+DR/ew7DhksvLDZCfzBmBkgg</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&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</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Retrieve">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7gxgle68rOpdiU60H88dR3jg8tiXy1P+WtqrPx3GF7OnlwhHsQ6cTtItvlQRh6vWUwVU4bBslwGREV3Iz15VrglHltY3jCWXhRdXkCuC36cWHTAKftmjaHSNYZSr4+24EsZqC1gBgk5jvb7QULjinmiZ90gKQwSE07ZxbObN2S+fsysWC3NPSLuKr2UJZh0qU7fSStc1hjJaN1Pmz05iO2OSOxIOLp//hB/ipw/yiV8dxLSGNfGTcyQd3eqe65LQVs/QZowm2/jAfW6rOSMXoAHzu4sj0apKViqz0UhoeX+6QUpgNlg6apzhr2YVtPP7HbHGIvfonOSz+9fkPjYdJB0rgdLBDoH39gKVTEOvpUixR3/nOGYlO9/WkmlClXeZJkWU4PU93gqrFzsw7ipqn5iQd6ZZ5N0Zj6vdjcW+vusLgwny/F95B1fXLhsAUbaSerhEj8X/lp95wgAdOU4KCH</Encrypted>]]>
      </text>
    </action>

    <action id="Employee">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7gxgle68rOpdiU60H88dR3+jJHx3cWJEku6bgZXJQ0YU1V/TSFs0GrC62N+e+wZW/nbjN0lzLkaEHo4ksQipTEJxM/a1zgacmVm5RAwCgYAR5zi6HqaXKvkS8GK6dsl0hOWK/0rOapNxVuNHVsIJe0u1tX8s5DLqpq3jkV/Y85HBlRj9Cu52iU4RB5IqK0Z1POyxGR+mWFhh92GhgQX2qw0nM8LDTAc1tjpa8J3672mRs8HCmaqVk1oj/VV+Ri4yodQVuSgpW7uUKVdJ7c0ipT</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK8mV8AnmiY4V/nu6YmGFxEfo4o7RdQitMnnDjAGJlUFPuNqLpwqWvMVcVyeYtcHAC54lSmg/Bk41nJkQN3a/gI9</Encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>
    <button command="Retrieve">
      <title v="Lấy số liệu từ thông tin nhân viên$$90" e="Extract Data from Employee Information$$120"></title>
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