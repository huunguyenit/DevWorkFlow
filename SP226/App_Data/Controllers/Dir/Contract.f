<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY Identification "Contract">
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">

  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Contract;
  %Control.Unit.Ignore;
  <!ENTITY c "ContractUnitDetail">
  <!ENTITY h1 "566">
  <!ENTITY h2 "172">
  <!ENTITY k "ma_hd">
  <!ENTITY i "8">
  <!ENTITY Tag "dmhd">

  <!ENTITY % CompactMode SYSTEM "..\Include\CompactMode.ent">
  %CompactMode;

  <!ENTITY % Nested SYSTEM "..\Include\Nested.ent">
  %Nested;
]>

<dir table="dmhd" code="ma_hd" order="ma_hd" xmlns="urn:schemas-fast-com:data-dir">
  <title v="hợp đồng" e="Contract"></title>
  <fields>
    <field name="ma_hd" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" >
      <header v="Mã hợp đồng" e="Contract"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_hd" allowNulls="false" >
      <header v="Tên hợp đồng" e="Description"></header>
    </field>
    <field name="ten_hd2" >
      <header v="Tên khác" e="Other Name"></header>
    </field>

    <field name="ngay_hd" type="DateTime" dataFormatString="@datetimeFormat" categoryIndex="1">
      <header v="Ngày ký" e=" Date Signed"></header>
    </field>
    <field name="so_hd" categoryIndex ="1">
      <header v="Số hợp đồng" e="Contract Number"></header>
    </field>
    <field name="hd_sd_pslk" dataFormatString="0, 1" clientDefault="0" align="right" inactivate="false" categoryIndex="1">
      <header v="Theo dõi số dư" e="Balance Tracking"></header>
      <footer v="1 - Có, 0 - Không " e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="ma_nt" allowNulls="false" clientDefault="Default" categoryIndex="1">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" readOnly="true" hidden="false" external="true" clientDefault="Default" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="1">
      <header v="Tiền ngoại tệ" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="1">
      <header v="Tiền hạch toán" e="Base Currency Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ngay_hd1" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="Ngày bắt đầu" e="Start Date"></header>
    </field>
    <field name="ngay_hd2" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="1">
      <header v="Ngày kết thúc" e="Finish Date"></header>
    </field>

    <field name="ma_kh" categoryIndex="1">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>

    <field name="ma_nvbh"  categoryIndex="1">
      <header v="Nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status = '1'" check="1=1" information="ma_nvbh$dmnvbh.ten_nvbh%l"/>
    </field>
    <field name="ten_nvbh%l" readOnly="true" hidden="false" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>

    <field name="ma_bp" categoryIndex="1">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>

    <field name="nh_hd1" clientDefault="Default" categoryIndex="3">
      <header v="Nhóm 1" e="Group 1"></header>
      <items style="AutoComplete" controller="ContractGroup" reference="ten_nh1%l" key=" status = '1' and loai_nh = 1" check="loai_nh = 1" information="ma_nh$dmnhhd.ten_nh%l"/>
    </field>
    <field name="ten_nh1%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_hd2" clientDefault="Default" categoryIndex="3">
      <header v="Nhóm 2" e="Group 2"></header>
      <items style="AutoComplete" controller="ContractGroup" reference="ten_nh2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2" information="ma_nh$dmnhhd.ten_nh%l"/>
    </field>
    <field name="ten_nh2%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="nh_hd3" clientDefault="Default" categoryIndex="3">
      <header v="Nhóm 3" e="Group 3"></header>
      <items style="AutoComplete" controller="ContractGroup" reference="ten_nh3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3" information="ma_nh$dmnhhd.ten_nh%l"/>
    </field>
    <field name="ten_nh3%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" >
      <header v="" e=""></header>
    </field>

    <field name="ghi_chu" rows="2" categoryIndex="3">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="3">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>

    &PaymentContractDirFields;

    &UnitFields;

  </fields>

  <views>
    <view id="Dir" height="&PaymentContractDirHeight;" anchor="&j1;">
      &PaymentContractDirView;
    </view>

  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2IFUTeYgCI+m73yMqsqvhVfK/NCPDhMSW1bAIXdU+QckZVgeFDw1lvwzbW4aQLPjIwaS6ACvBtbFKkH8K44onDq//wP9L6RECYZlDoAlCwfOUGHFll+gIMQ8mqjrVnfW7mQfzYyIGDX6UoTZBTVgrKs/f+/cLS83X0FWd1VtQIsQeHdy4d18hC3B29zYC/bPm/x3WJ1b0ijs4DEnpo035s</Encrypted>]]>&Contract.Nested.Message.v;<![CDATA[<Encrypted>&q0x/DRPtnEN53dA6mwugdvhdteZsnpuiQo1RylWCVQUrVVt4olQAVldkG3MGcPSJtRMMiXECbGRryy2+mdzgKcE017ErW3Sqc5lNR3mauZoa5nCLrwN5AWmCFSqlZpT+bbZXH7bqOrnjmijgeObuGg==</Encrypted>]]>&Contract.Nested.Message.e;<![CDATA[<Encrypted>&Gf3AUkJFg+tajSC6Sx7Gz6nmWt1Ha4WW/5tuOA5WB8AA/T8l3rbtgCtunFekX+1f8hmBA8rQLd0Zf+s22+/+2QQvgiRyFZh+qpkVENOyz+uF1fjGBxSeiNZwoo8mLkZNBuTp/7zsh0ZmHbRRgA76eM418SFuHRltf6XW2kzLWRvcrCICCnuwcJVEcKMUWnzX68b5pMRVVz8f0Ld63is1Xao3mKrOjYhBTYNBPEFxWK12Fr3SPePCkNJu7c0kr6RwJQ/eKqeRdO5NaMiQpDC8/R4gqUVWzE4kK1jITkYUdIzrTK0NHlxIFbIk/V4/kM6rsaU2EA4/qbLPNeQHwMkHHZG8FmrM5dDPKgH6sSczJSY7t96ZKeopMu9EdgacDaZrllx2udNQfG/Jrf1aTkXh4KXc7117m8etjTgEZt+FgThpKxej7z+bgxh8r0/UfL2/hJ+hPFvPtmMyanx1ZFwGnw==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDHwyWdnnAsOePGxNOFkX1fdEj0/forhlw/mwTNn4x6wpTJe0XLdMFgeg/M8V+5NtCiydMqE3u0Eu7o1WxwGFys=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBYezWCrEMH1fHatEHfnpcfG6aC+b9fII/Yuisded2SAoIt4F1FKNp6+a/70AeukbHL9zPOlQTUbM/sqnA/+54I=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwU7vMRJi5phIo/q55KJkMZKQ==</Encrypted>]]>&Contract.Nested.Key.a;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLZMHckGCQw6x8e76tZNpJUMesyazs6iP2EufVT7C8FFcsj8cgbBlKvWh9cfcF+DWXxBpNnrf6YzAb3jIdfx2W3kMzYtkX5S2I5O76L7TSpMTkaKJwsj6wJ2Q3Jyhi3hu4A==</Encrypted>]]>
        &UnitBeforeInsert;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGYB74MK6vr2F1KE/dz/+QvzDcL2uJJO9Ogl6CL18nBwMxIzCp6ONAm5MXgT9hAm5TDp9gKkHvve57mgmSqrHVI=</Encrypted>]]>
        &PaymentContractDirCommandInserting;
      </text>
    </command>

    <command event="Inserted">
      <text>
        &UnitPostInsert;
        &PaymentContractDirCommandInserted;
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZL4RWU2gt6qRxcZWiuKCvptq2Hi/OO9+iUEyyP+UpCRYmQE1ps/H3Fczdha6YX31FdBvoJwRB8QSCZEfM2QNpmyOvD4dlbtCJ3bzrjmfnyKBCwZCTUa/yyek9fxQWDFsZ13fO897XulZu/wrxpBfG6lyUIz5zhJewtD+zA8bRZhOzVy8M/tE7joiHA15DfaXc+</Encrypted>]]>&Contract.Nested.Key.a;<![CDATA[<Encrypted>&O0YyoFEd0hYz2N2q7aidVMCEeMEkkyqzhAsj0FBrJfhanYxI8WYzdmPXFMPn6MhkaqK+UTuS1tmzHjb3VLCMbU5NlWgKW8kbcjwjrOk/jNC6xXatTd/XOsI1E0rGcRJJ6Adi/CA2m4Zy0YZTkQgnzHDT7qvn0dbg82rWdZUXFobVyCMyxOzPhfDWZNfBJe8gwYpR9JCxVMhk+D5qPc7eP9RCvX+qPYUG8AjSQLWBPLobt6qfsnBwrLhZnovOfNc2zkIvPy0MZenKfBeX1bHdDL0sz+IWYvuUDeELqL/Zm8s=</Encrypted>]]>
        &PaymentContractDirCommandUpdatingUpdatePayment;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4WtYW9IrqZqI3ju9IZVQJSk=</Encrypted>]]>
        &PaymentContractDirCommandUpdatingDeletePayment;
        &UnitBeforeUpdate;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV7sjLUP+SdPnnE3w/2mkQYkJ4x62oKJVOm8PhP0l8GDE</Encrypted>]]>
        &PaymentContractDirCommandUpdated;
        &UnitPostUpdate;
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvmlX/1G4VEF8z4pOWdpqPPKEZpLXua7Laz/vu9gWWLySVgtgIPPBM/N87GKpq/tLvcsUasnj3jS4sKrzpspmtD2kCvGkL3hm/HtsOb9MM4yIPADMXbkYU4CalMz0LoqJRJyOaEpq4k4C8t1NOphnCXPatwgAK9HbNqBRaaVP1jAhGrSE8VcczZrn8UArV2S5jI=</Encrypted>]]>
        &PaymentContractDirCommandDeleting;
        &UnitPostDelete;
      </text>
    </command>

    <command event ="Checking">
      <text>
        &UnitCheck;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptQueryData;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SCO9kehimTPDbj6T8xCrPWqAfHoOJ714UmN681T5tpg</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&zRJIg4IrJ8FD8GxnZu9KjE6ET5pwU1lPXoM29kTvRO0FYRaB6hhFNQJHhWSq3jTnNaS0EC/57uDFOcIFamA9MA==</Encrypted>]]>&PaymentContractDirTabChanged;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XTBiYI2Pgg2Jd4XQSsKdOeQRTGe5KcRNPwNAa3fug+ZB7g3wi5MYlfdpcDWes0TV/6nSzoLjYx5/1+E+AVr7vtzq1GaMphbkN5yF8lSf2cg0KoSpYT/E6vB8b6SY99QP4R5k029DcCd0dCNsJKETJVgh8xFb7skgxBLCtqMHRqWGNBLYP8nGFYSnzdOX1Qvzw==</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFydQyDJEWQcT9b3p7KM5oA/A3nV5KYBwq2DDJUPhG8RPSetxHiHKE3f/2NJBDyOYzMq2AL7TlOgKbvZPZxQaHwLxq/bkrZA2M5Y2hcBCYKNXVqVZ3flvCGtkVjB8P+Yh0MFbaFS5Rr0r1MX7tMnQTmoE=</Encrypted>]]>&Identification;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFySG6TtBGaksaEw8ylGxrgDRbDZFAzIA3X1qjoEbHr31fGZSHCQ637vQGPSShFUXkuUVIvdJbO4rdX146YSU6a2hUAoYPgmqt5KhCSvfv8nRHRS2Y7ChhTJtckDYVYkS52SziBVMeIXLeFNthdlWFjzwS7eIfZpFBkptG+G1SWN+eciyqPGt8nJDlxcE5TV4oYwMFVA43UQiCG4O+MwUOwQB2MfV6kl096BJsHp6xlpyoHzDqRzAyTZNK946GgproUGgLHoxE9OsropPppqQ6ufH6twXesfwJ0v2qtxHk9yBrKO4xadOyzjRbRYnBnUcHyrGzJ//4ZPjB2AKbFM1Yy8g4RHhsgoJ0WwgEysI3yhDu</Encrypted>]]>&PaymentContractDirExecuteCommandDeclare;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZVtqIKsSorDJOSCkrtrNdl2wyVhMmNFIFASuqsUMflmN3Yw7PpiN8R3rLiCXfrCXQ==</Encrypted>]]>&PaymentContractDirExecuteCommandGather;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>