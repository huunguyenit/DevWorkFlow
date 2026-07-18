<?xml version="1.0" encoding="utf-8"?>

<dir table="hrenn" code="stt_rec, stt_rec0" order="stt_rec0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin ngoại ngữ" e="Foreign Language Information"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true" readOnly="true" allowNulls="false">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>

    <field name="ma_nn" allowNulls="false">
      <header v="Ngoại ngữ" e="Language"></header>
      <items style="AutoComplete" controller ="hrLanguage" key="status = 1" check="1 = 1" reference="ten_nn%l" information="ma_nn$hrdmnn.ten_nn%l" new="Default"/>
    </field>
    <field name="ten_nn%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""/>
    </field>
    <field name="mac_dinh_yn" type="Boolean" defaultValue="cast(0 as bit)">
      <header v="Ngoại ngữ chính" e="Main Language"/>
      <items style="CheckBox"/>
    </field>
    <field name="bang_cap">
      <header v="Loại bằng cấp" e="Certificate"/>
      <items style="AutoComplete" controller ="hrCertificate" key="status = 1" check="1 = 1" reference="ten_cc%l" information="ma_cc$hrdmcc.ten_cc%l" new="Default"/>
    </field>
    <field name="ten_cc%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""/>
    </field>

    <field name="diem">
      <header v="Bằng/Điểm" e="Grade/Marks"/>
    </field>
    <field name="ngay_cap" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày cấp" e="Date of Issue"/>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Description"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="11010011: [ma_nn].Label, [ma_nn], [ten_nn%l], [stt_rec0], [line_nbr]"/>
      <item value="11----1: [mac_dinh_yn].Label, [mac_dinh_yn], [stt_rec]"/>
      <item value="110100: [bang_cap].Label, [bang_cap], [ten_cc%l]"/>
      <item value="110: [diem].Label, [diem]"/>
      <item value="110: [ngay_cap].Label, [ngay_cap]"/>
      <item value="110000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9NfuaG7i3j7e+c+oQhTXMYAxJVNBx0KLk1Xbs+Pa2K50yJ2JTenel3OK43Ed6Y883zLp3EjZTFwR9RtLRVyk7Q=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9NfuaG7i3j7e+c+oQhTXMYAxJVNBx0KLk1Xbs+Pa2K50yJ2JTenel3OK43Ed6Y883zLp3EjZTFwR9RtLRVyk7Q=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbRptsr13iekuFddlJY0mM2fK+oF3iRl1qC+7kUXOWfRbMJJ3FfD2ehqzYE9ZPEHqtT4egQxozPtwZaSfKXhQI1V2RZvYfBfvscd+Tt+dJpbYVUWOHwX++cpbbefGHbFXntRFFm7zi4sFF0SBPMBBcw8kkf8jvv4q4RktFz4MspxwijFoYKDIRNu51lUou3dmLLVtgQ04BSW9CYmtfV+3Dcc</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3cUSXeTZYZV+H7Fxc7qoNsKg9nnLtpCTKK9yzFK8sDDyBIvGw7+O90ato0j10+gGPtfU21QTWr7NFNtOeCEKdqpjJhu5SbmBLtCGVtdqGQB/KpxKJBRL/e+3co5gYG03YFoeGmUN7LMjIWyot6bTCrr4HLmZfGi971Ud/RcvHhkL/W0DeMlmarc0KCyA2RI1Ms0blWjQfqD19YSPjVmKFXcuIm/mPi5jef0djDX3dJg/XgY6/A8/xmNIz0IhRiEEcUln5u8t5zmIuDTkhm7AosD+paT9+Mp2EGccAq9gFQxoeWrpw3rlWpj1DYlJSkqCLM</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1lgv30eXwxaRX2A5OIbRu9E9te8LiFDCQNPxwml39I+elE09nxMaU3xooZKLlzpWV/if9W1ByYcKrCMIrAncbkc5dZTQXMx9gYhkwwbt9BsVkORxrYJ3Jfv1mQ9tpJfdw==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3cUSXeTZYZV+H7Fxc7qoNsKmTj+Uv1kvujTJyRabWWRGWRViTIxYJDlvszlAkabYDISNS60vtpf6qHBD0lJRgm2HMJ85eTDBvjZSfWWM9jaCVH8ZrxcskhshzEM3DVEupBHGj8y0Qtr8dJeYhNppzHQ9lJZE7EhowTjsxw6p678nY=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1lgv30eXwxaRX2A5OIbRu9E9te8LiFDCQNPxwml39I+elE09nxMaU3xooZKLlzpWV/if9W1ByYcKrCMIrAncbmXrnuEFi/vdTdZ2VrOppQ5pVSBnGapMxbmynkepLoM0cmZd8qyvoO5pq89AC5GeOuGVzstCEJSjDpZ0KuMJbfl</encrypted>]]>
      </text>
    </command>

  </commands>

</dir>