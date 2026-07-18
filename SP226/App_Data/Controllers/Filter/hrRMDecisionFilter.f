<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrrmqdtd" code="ma_hs, stt_rec_nv" order="ma_hs" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Thông tin nhân viên" e="Employee Information"></title>
  <fields>
    <field name="ma_dot">
      <header v="Đợt tuyển dụng" e="Period Code"/>
    </field>
    <field name="ten_dot%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""/>
    </field>
    <field name="ma_hs" isPrimaryKey="true" allowNulls="false">
      <header v="Mã ứng viên" e="Candidate ID"></header>
    </field>
    <field name="ten_hs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Mã nhân viên mới" e="New Employee ID"></header>
      <items style="Mask"></items>
    </field>

    <field name="ma_bp" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="hrrmqdtd"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vtr" allowNulls="false">
      <header v="Vị trí" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1" information="ma_vtr$hrvt.ten_vtr%l"/>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_vao" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày vào công ty" e="Date Hired"></header>
    </field>
    <field name="bac_quan_ly" onDemand="true">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac_ql%l" information="ma_bac$hrdmbql.ten_bac%l"/>
    </field>
    <field name="ten_bac_ql%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_ql" external="true" defaultValue="''" onDemand="true">
      <header v="Người quản lý trực tiếp" e="Direct Supervisor"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_ql%l" key="status = '1'" check="1 = 1" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99E6W5EvUrU1XkvoV7/dUNkBRidm+O6xeKYji3YQvT6JSZZrgRRzdaovXvIFBLi42Mfymg1Bc1jF2XD5sVGTbZUA=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_ql%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_ttnv" allowNulls="false" onDemand="true">
      <header v="Tình trạng nhân viên" e="Employee Status"></header>
      <items style="AutoComplete" controller="hrEmployeeStatus" reference="ten_ttnv%l" key="status = '1' and ma_ttnv not in (select val from options where name = 'm_tt_nghi_viec')" check="ma_ttnv not in (select val from options where name = 'm_tt_nghi_viec')"/>
    </field>
    <field name="ten_ttnv%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_tn" external="true" defaultValue="''" onDemand="true">
      <header v="Người ký tiếp nhận" e="Recruited by"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_tn%l" key="status = '1'" check="1 = 1" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99E6W5EvUrU1XkvoV7/dUNkBRidm+O6xeKYji3YQvT6JSN+AX5D8Z/UAM+gG/H09uEaJavaWo/jktcKslaxR3zJY=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_tn%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="stt" type="Decimal" dataFormatString="####0" defaultValue="0">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>

    <field name="stt_rec_ql" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_tn" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="110100-: [ma_dot].Label, [ma_dot], [ten_dot%l]"/>
      <item value="110100-: [ma_hs].Label, [ma_hs], [ten_hs%l]"/>
      <item value="110----: [ma_nv].Label, [ma_nv]"/>
      <item value="110100-: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100-: [ma_vtr].Label, [ma_vtr], [ten_vtr%l]"/>
      <item value="110----: [ngay_vao].Label, [ngay_vao]"/>

      <item value="110100-: [bac_quan_ly].Label, [bac_quan_ly], [ten_bac_ql%l]"/>
      <item value="110100-: [ma_ql].Label, [ma_ql], [ten_ql%l]"/>
      <item value="1101001: [ma_ttnv].Label, [ma_ttnv], [ten_ttnv%l], [stt_rec_ql]"/>
      <item value="1101001: [ma_tn].Label, [ma_tn], [ten_tn%l], [stt_rec_tn]"/>
      <item value="110: [stt].Label, [stt]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1mcU9B+qp2HnejV+7HX6P4v0SUfpOJr88gttGAmBOGnbQ6toUwn+UewraZEJTcdzk8PPk4nTRPY5DX8r6fIBpa4SOvx5hlwQIl/EectjW96SafEl1FaFmToukEA/F2/txmUjo2eYrFq1iecc7GAvbFGq/mIwN31XKNX9rB3U2FuCkNNg4fm0G5kz6bFnWDwTrcmbxeptevNJIWguB9gBc+O4YuRLL+k5mrikTE+DpcQ</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDyZc39x+urkHqzmUZY+FECbdyhJmZPRgYGstESCCwgAKMhpCncaT3i6jowmgSwPkpmFL14jbBl3Lrs1SrePrW0=</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq3eQSBHpNUYRxw7SF58+5+fD3tcNguZWt548pxbwxg9J2gm8/56U4nii4EYiRJlspYWeb02J4WyzaD6jjy3JQoeMKHY+BO9iOs1locJblGngJ7e7JjT4XodLR09EugsLIIpR8SxkbeZTicY13Ktk/TLWqtdr/c4rFHTfKdb/slyjhVmDGoJHj04vj0htx9adl3u5KrhmqRqGsVmBYGnvIudFIQ8qHFUIfhlGiKj2sL5vRkhGDQn32Mh/T2nxmd04ebDOfLxexWILZsmdCK0UdOp+L/YTYeeVnpbY1MuyodaSRqrUPGVMq6w8EB630Htyk8C0k8dFivRiXWCRi8CoEafjFHlAUTQvQI0elrggnXKVQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgawFXgFVgpAYaabj59XXw4aqnPd0zLsDowLmpyjoTSqHvPPfuKLet2BBHwpoXw9nWDjBB1psX0AMEPOWJanzlZtMCtgoinFpcHrV2yOgTgw+KIU+rzcN4oUqXhSncrqD2EPGEnR4HxoawOgVazJVv205tF4F+WfksS86v1AC4MXtgDUzN23yurCqO0t1jwaRYuQBqNeMl+Z8J7Jd6z4U1Sr/m7Vwq3ZhwtaOyrB409JM7o+0uW/oDGCQqdDGQb+jnfuK9AsCyv/woHxsksdwHlgYxsW+GXBM84ui6mxs8jh8MOqUENfdIXiYYkNxB2XflBz7NU5sVNU+Tvy2xCC0Iaurm6as4kHicKBQdKhVjSfJ46jWm8t0VI7cJbBNhpF4tdz2m/9mXNpvXZ+86TyN+AO5ks803FbQ/QamtDBKTdbEokcINB8TtlJtNJd9iR2rosJVWOOX55yzxOtppeKZNPJcIt0E3SoSNXVGWACOtd+GmSHBfGP7UXQeCJxYUVIEbnw1Pn47eBc32oai1N4ZZM8A</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&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</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtbYcBl3nXuedaGUBO3v2Faqt74FEPOcq3TvAfb42lGO3X5Dzvihuh6LYcDBrclqqzeqcs9WRRc0bvScAM0+swF/3jScNYew7u9YwS24brar9xAwuJOCsn0KVzXcb7cuzTKhqBa7eW1C0Lm+MLulKFZPOedWHtMK0/2usnyDz0aGecxZ3+YMJRCWdsnSL30sp7NEcLUVN4/SA733nascYcwfcnYxFiQkv9NwDnXj7xhPu1WfN1yRc7yZQmhIFIBMKtzB9mU939wyCK6rdc4tnjaTsjtR7DmCt3f6C0tCojgrIIq1wmVoF5HzwLkvuDXszTMkev6z/UCEdJPMkiz6uNcqbqV9lZi+VZZRviPJ0jW5j7artr+TDgVDc1x61tIVCMWCq9J2sssD6ryx9fZfbN6n1rTx5xuTmF8vbqh/JFfBLWGY5OAs/L2in1+tu883mwcB61LzQAXdZgNjToT8DBB5118/AJ3Fqaeafvf7d2OEa9y80x0yzaTAQC5aSut2UgwP9lk31j9RYYQAcCu1nzz//Yzd6ned7Obcb2uUHiXTwZpfxQBnax/4kwq5EHPs/KuUzxMUcM6qlgIa93mBZbBnn4akBWeuT/SXB2h+pbC+XF7wOolPg/Yvb6X6KhvGqwZzwHK389C5F20jg+czFEmkjkNtNUjSe9xgd88N2CpIB57X0KDt57CfCM6TNL8g7QSLEXttn/UQ6rHce8E/ZL+DOC2k56mIt105f5tg4Cl8qko1vkyCLQwRRywwovVAHDa52ml4NyApX5KqKRrJOARnWb4SUSdkFOndM3Aa4aGpobq7xFkqffIn5Jdzdx2quSK9+T1wNIpFDM1aqvnutXtVB94BmV6ahZxaMr5kCBxLPDQW3bfGrJAhnDtxQm1LiHHcifH5U8034k7goAgFYfE1NBdv+BKe7uFO4BffnSYM4f5r4VmUazzhHYI8k3wPObg==</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <response>
    <action id="Employee">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5p1ONhnQ/dVeNDqmQY5tBTf9gniI5ZdZXG2dYHCvwCWNRE7oibOz15UAauBnUtmvG2plJ0n8VduM9zqgaRb4YlgHc2QW3PV5HfWGJB4RT7LQ==</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>