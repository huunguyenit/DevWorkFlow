<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
]>

<grid table="ctrt" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="SF3" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="ctrt" prime="ctrt" inquiry="ctrt" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="ma_cd" allowNulls="false" width="100" dataFormatString="@upperCaseFormat" aliasName="a">
      <header v="Mã công đoạn" e="Operation Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_cd" allowNulls="false" width="300" aliasName="a">
      <header v="Tên công đoạn" e="Operation Name"></header>
    </field>
    <field name="ten_cd2" width="300" aliasName="a">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="kieu_cd" allowNulls="false" width="100" aliasName="a">
      <header v="Kiểu công đoạn" e="Operation Style"></header>
      <items style="AutoComplete" controller="CROperationTypeList" reference="ten_kieu_cd%l" key="ma_nh = '1' and status = '1'" check="ma_nh = '1' and status = '1'" information="ma_loai$sfdmloaicd.ten_loai%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQoxzub7uvxry5vTb4ZK4CvFMwtadr+To2lhCTkO/xdFYmUhhClFSLxI/5pFONw98RU=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kieu_cd%l" readOnly="true" external="true" defaultValue="''" width="0" hidden="true" aliasName="d.ten_loai%l">
      <header v="" e=""></header>
    </field>
    <field name="cd_truoc" width="100" dataFormatString="@upperCaseFormat" aliasName="a">
      <header v="Công đoạn trước" e="Previous Operation"></header>
      <items style="Mask"/>
    </field>
    <field name="cd_sau" width="100" dataFormatString="@upperCaseFormat" aliasName="a">
      <header v="Công đoạn sau" e="Next Operation"></header>
      <items style="Mask"/>
    </field>

    <field name="ma_vt" allowNulls="false" width="100" aliasName="a">
      <header v="Bán thành phẩm" e="WIP"></header>
      <handle source="dmvt.ma_vt" foreward="true"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1' and loai_vt in ('41', '51')" check="status = '1' and loai_vt in ('41', '51')" information="ma_vt$dmvt.ten_vt%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrtNZry7qPMbwHsBNsjc6Mk1WRLgRhbTBAqb5u7VmEUWTYQCFG+3awI/CHACMPUNGw=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" width="0" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt2" width="300" aliasName="a">
      <header v="Bán thành phẩm cộng thêm" e="Extra WIP"></header>
      <items style="Lookup" controller="Item" key="status = '1' and loai_vt in ('41', '51')" check="status = '1' and loai_vt in ('41', '51')" information="ma_vt$dmvt.ten_vt%l"/>
    </field>
    <field name="dvt" width="50" aliasName="a" allowNulls="false">
      <header v="Đơn vị tính giao dịch" e="Transaction UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="(ma_vt = '{$%c$%r.[ma_vt]}' or ma_vt = '*')" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
      <handle key="[nhieu_dvt]"/>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" width="0" hidden="true" aliasName="i">
      <header v="" e=""></header>
    </field>
    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>

    <field name="loai_cd" allowNulls="false" width="100" aliasName="a">
      <header v="Loại công đoạn" e="Operation Type"></header>
      <items style="AutoComplete" controller="CROperationTypeList" reference="ten_loai_cd%l" key="ma_nh = '2' and status = '1'" check="ma_nh = '2' and status = '1'" information="ma_loai$sfdmloaicd.ten_loai%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQojMMqyi8ID2aU83LBFjAoj0JT1ikmnSM5mlu+CuodwohtWpZqESmXEHeO3OGcYJV4=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_loai_cd%l" readOnly="true" external="true" defaultValue="''" width="0" hidden="true" aliasName="e.ten_loai%l">
      <header v="" e=""></header>
    </field>
    <field name="ma_ccv" width="100" aliasName="a">
      <header v="Trung tâm công việc" e="Work Center"></header>
      <items style="AutoComplete" controller="CRWorkCenterList" reference="ten_ccv%l" key="status = '1'" check="1=1" information="ma_ccv$sfdmcumcv.ten_ccv%l"/>
      <handle key="[loai_cd] == 2 || [loai_cd] == 1" field="loai_cd"/>
    </field>
    <field name="ten_ccv%l" readOnly="true" external="true" defaultValue="''" width="0" hidden="true" aliasName="g">
      <header v="" e=""></header>
    </field>
    <field name="ma_cm" width="100" aliasName="a">
      <header v="Cụm máy" e="Machine Center"></header>
      <items style="AutoComplete" controller="SFCMachineCenter" reference="ten_cm%l" key="status = '1'" check="1=1" information="ma_cm$sfdmcummay.ten_cm%l"/>
    </field>
    <field name="ten_cm%l" readOnly="true" external="true" defaultValue="''" width="0" hidden="true" aliasName="h">
      <header v="" e=""></header>
    </field>

    <field name="tg_bd_cds" type="Decimal" dataFormatString="@HourInputFormat" align="right" width="100" aliasName="a">
      <header v="Thời gian bắt đầu công đoạn sau" e="Overlap"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_bd_cds" type="Decimal" dataFormatString="@quantityInputFormat" align="right" width="100" aliasName="a">
      <header v="Số lượng bắt đầu công đoạn sau" e="Send Ahead"></header>
      <items style="Numeric"/>
    </field>
    <field name="tg_cho" type="Decimal" dataFormatString="@HourInputFormat" align="right" width="100" aliasName="a">
      <header v="Thời gian chờ sản xuất" e="Wait Time"></header>
      <items style="Numeric"/>
      <handle key="[loai_cd] != 3" field="loai_cd"/>
    </field>
    <field name="tg_cai_dat" type="Decimal" dataFormatString="@HourInputFormat" align="right" width="100" aliasName="a">
      <header v="Thời gian cài đặt" e="Setup Time"></header>
      <items style="Numeric"/>
      <handle key="[loai_cd] != 3" field="loai_cd"/>
    </field>
    <field name="sl_may" type="Decimal" dataFormatString="#### ### ##0" align="right" width="100" aliasName="a">
      <header v="Số lượng máy" e="No. of Resource"></header>
      <items style="Numeric"/>
    </field>
    <field name="nang_suat" type="Decimal" dataFormatString="@CapacityNumberInputFormat" align="right" width="100" aliasName="a">
      <header v="Năng suất" e="Piece Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="cach_tinh" allowNulls="false" width="100" aliasName="a">
      <header v="Cách tính" e="Time Basic"></header>
      <items style="AutoComplete" controller="CRTimeBasicList" reference="ten_cach_tinh%l" key="status = '1'" check="1=1" information="cach_tinh$sfdmcachtinh.ten_cach_tinh%l"/>
    </field>
    <field name="ten_cach_tinh%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="0" hidden="true" aliasName="f">
      <header v="" e=""></header>
    </field>
    <field name="tg_vs" type="Decimal" dataFormatString="@HourInputFormat" align="right" width="100" aliasName="a">
      <header v="Thời gian vệ sinh máy" e="Clear Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="tg_chuyen" type="Decimal" dataFormatString="@HourInputFormat" align="right" width="100" aliasName="a">
      <header v="Thời gian chuyển" e="Move Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="nc_cai_dat" type="Decimal" dataFormatString="#### ### ##0" align="right" width="100" aliasName="a">
      <header v="Nhân công cài đặt" e="Setup Resource"></header>
      <items style="Numeric"/>
    </field>
    <field name="nc_th" type="Decimal" dataFormatString="#### ### ##0" align="right" width="100" aliasName="a">
      <header v="Nhân công chạy máy" e="Run Resource"></header>
      <items style="Numeric"/>
    </field>
    <field name="cc_sd" width="300" aliasName="a">
      <header v="Công cụ sử dụng" e="Tool Number"></header>
    </field>
    <field name="ma_kh" width="100" aliasName="a">
      <header v="Nhà cung cấp" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1=1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <handle key="[loai_cd] == 3" field="loai_cd"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" width="0" hidden="true" aliasName="c.ten_kh%l">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="tg_gc" type="Decimal" dataFormatString="@HourInputFormat" align="right" width="100" aliasName="a">
      <header v="Thời gian gia công" e="Subcontract Leadtime"></header>
      <items style="Numeric"/>
      <handle key="[loai_cd] == 3" field="loai_cd"/>
    </field>
    <field name="cp_gc" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align="right" width="100" aliasName="a">
      <header v="Chi phí gia công" e="Subcontract Cost"></header>
      <items style="Numeric"/>
      <handle key="[loai_cd] == 3" field="loai_cd"/>
    </field>
    <field name="tl_kt" type="Decimal" dataFormatString="##0.00" align="right" width="100" aliasName="a">
      <header v="Tỷ lệ kế thừa nvl công đoạn trước (%)" e="WIP Consumption Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_kt2" type="Decimal" dataFormatString="##0.00" align="right" width="100" aliasName="a">
      <header v="Tỷ lệ kế thừa btp công đoạn trước (%)" e="WIP Processing Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="tru_dm" dataFormatString="0, 1" clientDefault="0" width="60" align="right" aliasName="a">
      <header v="Trừ định mức" e="Backflush"></header>
      <items style="Mask"/>
    </field>
    <field name="td_chuyen" dataFormatString="0, 1" clientDefault="0" width="60" align="right" aliasName="a">
      <header v="Tự động chuyển" e="Auto Move"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99KLLoBDuaAbzztBiaBgDyq/EEzvZibuTUzY/ZdK4pbzGflaaJOQZKwJnSY5qEAbkkiC29Q9lbaOo6WQR6d1yhy8=</Encrypted>]]></clientScript>
      <items style="Mask"/>
    </field>
    <field name="dung_kt" dataFormatString="0, 1" clientDefault="0" width="60" align="right" aliasName="a">
      <header v="Dừng kiểm tra" e="Inspection Stop"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99KLLoBDuaAbzztBiaBgDyq/EEzvZibuTUzY/ZdK4pbzGflaaJOQZKwJnSY5qEAbkkiC29Q9lbaOo6WQR6d1yhy8=</Encrypted>]]></clientScript>
      <items style="Mask"/>
    </field>
    <field name="td_phi" dataFormatString="0, 1" clientDefault="0" width="60" align="right" aliasName="a">
      <header v="Tự động tính phí" e="Auto Charge"></header>
      <items style="Mask"/>
    </field>
    <field name="nhap_sl" dataFormatString="0, 1" clientDefault="1" width="60" align="right" aliasName="a">
      <header v="Nhập sản lượng" e="Count Point"></header>
      <items style="Mask"/>
    </field>
    <field name="nk_yn" dataFormatString="0, 1" clientDefault="0" width="60" align="right" aliasName="a">
      <header v="Tự động nhập kho" e="Auto Good Receipt"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99KLLoBDuaAbzztBiaBgDyq/EEzvZibuTUzY/ZdK4pbzGflaaJOQZKwJnSY5qEAbkkiC29Q9lbaOo6WQR6d1yhy8=</Encrypted>]]></clientScript>
      <items style="Mask"/>
    </field>
    <field name="xk_yn" dataFormatString="0, 1" clientDefault="0" width="60" align="right" aliasName="a">
      <header v="Tự động xuất kho" e="Auto Good Issue"></header>
      <items style="Mask"/>
    </field>

    <field name="ghi_chu" width="300" aliasName="a">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_cd"/>
      <field name="ten_cd"/>
      <field name="ten_cd2"/>

      <field name="kieu_cd"/>
      <field name="ten_kieu_cd%l"/>
      <field name="cd_truoc"/>
      <field name="cd_sau"/>

      <field name="ma_vt"/>
      <field name="ma_vt2"/>
      <field name="ten_vt%l"/>

      <field name="loai_cd"/>
      <field name="ten_loai_cd%l"/>
      <field name="ma_ccv"/>
      <field name="ten_ccv%l"/>
      <field name="ma_cm"/>
      <field name="ten_cm%l"/>
      <field name="dvt"/>
      <field name="nhieu_dvt"/>
      <field name="ten_dvt%l"/>

      <field name="tg_bd_cds"/>
      <field name="sl_bd_cds"/>
      <field name="tg_cho"/>
      <field name="tg_cai_dat"/>
      <field name="sl_may"/>
      <field name="cach_tinh"/>
      <field name="ten_cach_tinh%l"/>
      <field name="nang_suat"/>
      <field name="tg_vs"/>
      <field name="tg_chuyen"/>
      <field name="nc_cai_dat"/>
      <field name="nc_th"/>
      <field name="cc_sd"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="tg_gc"/>
      <field name="cp_gc"/>
      <field name="tl_kt"/>
      <field name="tl_kt2"/>
      <field name="tru_dm"/>
      <field name="td_chuyen"/>
      <field name="dung_kt"/>
      <field name="td_phi"/>
      <field name="nhap_sl"/>
      <field name="nk_yn"/>
      <field name="xk_yn"/>

      <field name="ghi_chu"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcId2xB+L9A0FuJAQVgRyH0gM/L5jLwqjOegq/ugev0ANP+pl12wcpq/b05VIXZBplJ6RKGQ/i10U6VIkxiyGbBSP8+c+XYPM64Cxku4oV04FWyhD4ufyzHGiT37R6lbJEA==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKV8SQqddMG9kdcvUjxHMu6bzSZGQTwdbvEgcxi+kcNHACK6ZzFtTXa9o2LCkFeYcXe+AlMUWjmyygqGA9Yq4w2o</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8aFFhpNj5+u9WMGtcb4/eEAwYZcB3DJ8VktUj+e3SXGjczj1lep4VPWDCjgMPhpa1fEHNjQWSNnP+L5HW2+aw2RJyM0G6NNmaUu7TJWLh2BrNxOJFBEeLax3UiedBsCKTFP+RqqNqkVqvceXC89NUICYzW2YpK5tqFfjqYqiI38B/JZ7jdHbL6IlYDUdFHhMK7NvjfeGNA7xyKSQxIkBq8L+hkU1t73qJiLxgrrLFULJX87XQMzNQBZ+LMSR37MerSjN/NolLmFwmdRmbHA2o2ZOC8KXp8UAf4jR2x3KXEG0HROOMz84BdNJjRVXgydCCEmhUwvXrLoPebpNGdKFCCv4Qj01HsbxEeja+vriIDREsEbWhuuGp/0v8ZNRPB1PgXjoeFogHWvwkHMtE5rV2u7duHjyeHqTbG46Ou48sOHM0NWFXO/7j9UqPT92CxeBLAa8DMkDNAf0X9Cb8Y8Ke0idoiOjR/mLF53pqW0ZeCeigVmYPL+JzA+m4uMm/BALt7FySDDj8foVKqaAaj5J+hQc2JthFDG8qnzGDnFrXu+wYXuVl4c4IpeKVMoCy7dbaLck46igvoyX0G9NNC7glrOSlPDO1WfJfeDzg2wr5IzF0yh0Z2JWOrqWD32deiJj2yPYn35DpBeY0deoYBACl5Eq/jU/H4LactksBHLjw/zJzuITAt0Xa2+d3phfcECEj34MPLv0S+4G2aFA/CznuGNbrkAKTL6794D/nw2H+Vu2C/lRh3KnkvzLWeAc2gqwcl6siXkV3iDIB6VN0fD96VUpUK0rbIYvfPUr0gt0xqmgdfLCudELQzYYbYHd63dnj/sLe3yObbRo07wDuIaLS5FUQHMYSSiwYWisWA0n4eRzmfiKk4tD2NOKeO2Ed4YJEGPZesqVernSh7rukacFtuLPMV8ZgZfFmw0cthbfmqqM+4cgV1Jp/uAxfyigk0WtsDq8A96cEvofiL+8zGsDEZVeNs1B6TuVeq4+qELjWcB7ZG3fneD7iVwL/dSp2OVKUML2h7Fl5cWPjSPwOKSoKiUBJ2XJG7+gP4xGp2REQXiY1K/qGJF+7ripqXE46M3d2zukO/eGd9yKeb8eMoUFJ1fu7KNAbA89bob4JzLK14ZosNrJGzf6qwnKiFNfoVxzctWqTP3WkMyQwSct4MQAMqBHjraBqi5WT1Mc+3d1qfj216TiXGSrXoh6p4ptGfiwdiVhGTa4WRwJxp9F+1Tjci9Zn0ImNROig47wGemNuJJPIGV9y27abtRlKBl6v98uSWlwueyq94qNeRKTUYieHfj9nWPWazfGdsRRs+q/xC9fLZvih6KNHMaU5VLMTz6J716+K2X2Fj5hfXZp44Y5YplaRvP63iZqBZqAQnq5mDAn3QDrrhYJE1hzLf0GRd678=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXNIu1i9vLplAyNQLu+wb4QUTjHz85T5go0iHoegrpQgsx6MBgE6nKDt9AXnIzRvH6767FKu/b2rfih1zwvVkVx0x80Qn7ohfebMTW2aoWi30BvZLBGPrmgzfQAr2sYjBQw==</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK+w0/7TuML2kYZ1eE3mLRhdCaEvPJxREL+UILLtzYqR4cmS5lLGkfuAvI/hv64J7roOWRoaXlgMjBqxBRXhO1f7rDO8p8e8d2FOmQwqG/+3iFWt3I4I7YfYswytAKwX7gV/TPugIzT/Cg3cxr/pHdqyWlsgUtNL2kMQAWmfKDpm1V7LkfOoUkooLmjg3TRNZvBFF4G1KhcU6x7Nfi48T1wrkU6XD6ss8hZW7a1LpIsQLo60R3CIRyqtFtjX8pG+U2r/OiYjee0NsFmaJ7pxh39nxvbFjjI4+MTdUBG0SiQ+1jO0vnm34MVd71mmV+gTPYjnhYeVQi6m4G3bUBljJ8m7</Encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu39PU2peMcOwZIaD+XcTJiHtGxjbkGqJBEylB9coqKjVbTwjBjtHHA/igUF4v9KUpgA/UaZ7YtGF2LVSfThLSxcBwHegD0df/xYi9SII+z6bC8rz7VnmLnncL1huRnGkoLWG9ELCoRF5ceG1kVWKkwi/87O/i9nziMVk7gGeoIBb8AetH5o/NBaaQPhUVLoFQ9HcEQQxAzVuYkWqr6HeUyCCZwsPb2eEqH2wTI1bRPPIpp23Yq3uufzY35xLsxAThg==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="AddDetail">
      <title v="Thêm chi tiết$$90" e="Add Detail$$75"></title>
    </button>
    <button command="EditDetail">
      <title v="Cập nhật chi tiết$$90" e="Edit Detail$$75"></title>
    </button>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Grow">
      <title v="Toolbar.Grow" e="Toolbar.Grow"></title>
    </button>
    <button command="Down">
      <title v="Toolbar.Down" e="Toolbar.Down"></title>
    </button>
    <button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>

    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>