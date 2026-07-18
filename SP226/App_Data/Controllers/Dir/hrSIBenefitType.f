<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmktcbh" code="ma_kieu" order="ma_kieu" xmlns="urn:schemas-fast-com:data-dir">
  <title v="kiểu trợ cấp BHXH" e="SI Benefit Category"></title>
  <fields>
    <field name="ma_kieu" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã kiểu" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_kieu" allowNulls="false">
      <header v="Tên kiểu" e="Description"></header>
    </field>
    <field name="ten_kieu2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ma_tcbh" allowNulls="false">
      <header v="Mã trợ cấp" e="Benefit Code"></header>
      <items style="AutoComplete" controller ="hrSIBenefitItem" key="status = 1" check="1 = 1" reference="ten_tcbh%l" information="ma_tcbh$hrdmtcbh.ten_tcbh%l"></items>
    </field>
    <field name="ten_tcbh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kieu_me">
      <header v="Mã kiểu mẹ" e="Parent Code"></header>
      <items style="AutoComplete" controller ="hrSIBenefitType" key="status = 1" check="1 = 1" reference="ten_kieu_me%l" information="ma_kieu$hrdmktcbh.ten_kieu%l"></items>
    </field>
    <field name="ten_kieu_me%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="stt" type="Decimal" dataFormatString="###0" defaultValue="0">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 50, 280, 0"/>
      <item value="1100: [ma_kieu].Label, [ma_kieu]"/>
      <item value="110000: [ten_kieu].Label, [ten_kieu]"/>
      <item value="110000: [ten_kieu2].Label, [ten_kieu2]"/>
      <item value="110010: [ma_tcbh].Label, [ma_tcbh], [ten_tcbh%l]"/>
      <item value="110010: [ma_kieu_me].Label, [ma_kieu_me], [ten_kieu_me%l]"/>
      <item value="1100: [stt].Label, [stt]"/>
      <item value="111000: [status].Label, [status], [status].Description"></item>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDHwyWdnnAsOePGxNOFkX1enUB6r9uGEstT205+aDImyCLqNI+YdXaOZ+1K0wdZV8dM+xGzsLLzQs7Gn5DUJrVO+jvZWMl1WvYqUbcWqcn5l</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFLTtxwxLS0qUVnguBBCPvPyaBuPDd64Wv/o80vH0E6KMFMHJdqNaA54WoLMi0N1QVADKL3EXr0itnyJ/wplv2W7NtGFZ+tRc4CVTzXcCZzl</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3aN/7PxwrNmja2J0eINLzr75dq/rvCS29kqE6yuJQlQzxF7m+u6+ThJ3YnwQr4Le3M0a+Eg28FESqtcmyPbNa5yplG7t9n9poHu5918wdyeUeIFxhiVGAL0GYD6V/AuxQwTAzFAMW+mYqa8moO8bTtfpVs1KuPH//LeIwL/pU7n20eoUJYqtw4LK6vXib4wmE4Zii/jCnkLtF2IxwhROIr/AvfosSbRrX+RAAX3dOhq/u+HcO3x9lLbEmPCSFbiNKVIuHqj7rWaeqlK78HrrCOt3tNAcNA7LsZHrsAw40cxMZW7HdJErSth/Ul3LlH9SA8XiymYolphegB8w5gOIvMP6POEUIW40jvYEdPwHWkzJs03iLFvL5aKgQeP2pxbWMMx92FOQtZdGeN5LZj4yLbrj7Hi9XyHeuKHspBYqt9ZsOyvSQKKSUX2xxveSgRqZfiezfrGE4euVur7IYVimnE3KIe4ZE9u4px6hlgpOfK/Lpbwzm75Jmuhg0W/xrYC1d8oo/JQOjV6qNm9s5Mi0xnsg==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwUPg/XvPNB4gWvhP0CDEF8JkgooF1uutMsni2ZIcBxlTGwWsEO1OrRjk6B7/RFbXV/UCZl18GcfS9EbUHyQAXN7tFj4VrmbaaLh4Qugz33Hx4sPdqlQRJFfLtfWOKGMl6AZlWOhvbK/0OrBjUUwAjGBkdB910ZOHTNTdAzvLnEIbNJhIHesLU1v+b1jovG/VK1f4hb4X4cq0aOejcDvQdw6Rp3BdrfMzUyJ6BhghFOglM=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLfl3ZgPhYrc8GlkoBQI8Zf0C23PE3j367fGHML+QFltawFM7WlX7YSm43vFwDsI7nhoo7pS3QyHcyQVRxyC0+B31G0Qes9tmbSTsxG/AMsdkh1jdVEqc8kkwvD7Je5+MtVLZvDFK+VD6HkD+0RuCQWQdQ/sCTPR+6X08zSKDh0ImMxbsrkldir4N4w5ygJ/hFNzY436XCPr+vD7a9/4h5qyy15jsV4yWp22UozrAYEShbAY1ooyHJhPMjyGeC2ORgJj7BIqPv8IULmR0a0/cGp3hdxz0NL8DBEnBnNB8Njxo=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV6zHjG2X3LliDD4Rv0nr8mpdyFe9W28/WowGWUl6e697</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtWhpeAlQ4np4mE/zkBWJgfAyPuHTt6LkvN9o2TFZYkWaULqU658dp/EKwXh6BxrahKEhkLLU30PXcnCqmXW+H5Z5PVwWGEMRyoXj7C1Ef/ujRSS/wscpiJhaTPecS7nmCoxq1CZh+0Pxgeu90z8K50Ly6BTXNAUabO7UPxB9BUZIZTgGWB4rs2itj0JIjjc44VNGZJHjr51e+CY7MzAIInp/X7LCt+jcyPXhhgv8xN1eacwUZRm6ed/ZkGYOaKtVH1eF37XkDLYVFgZxlaObNPGP1h0QhOWNVKXYiw8x0VyG</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>