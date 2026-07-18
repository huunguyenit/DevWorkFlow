<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLGridCommandExtension SYSTEM "..\Include\XML\GridCommandExtension.xml">
]>

<dir table="hrebcm" code="stt_rec, stt_rec0" order="stt_rec0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="bậc nghề nghiệp chuyên môn" e="Speciality Level"></title>

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

    <field name="ma_cm" allowNulls="false">
      <header v="Chuyên môn" e="Speciality"></header>
      <items style="AutoComplete" controller ="hrSpecialist" key="status = 1" check="1 = 1" reference="ten_cm%l" information="ma_cm$hrdmcm.ten_cm%l" new="Default"/>
    </field>
    <field name="ten_cm%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""/>
    </field>
    <field name="mac_dinh_yn" type="Boolean" defaultValue="cast(0 as bit)">
      <header v="Chuyên môn chính" e="Main Speciality"/>
      <items style="CheckBox"/>
    </field>
    <field name="ma_bac" allowNulls="false">
      <header v="Bậc" e="Level"/>
      <items style="AutoComplete" controller ="hrSpecialistLevel" key="status = 1" check="1 = 1" reference="ten_bac%l" information="ma_bac$hrdmbcm.ten_bac%l" new="Default"/>
    </field>
    <field name="ten_bac%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""/>
    </field>
    <field name="ngay_hl" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230, 0"/>
      <item value="110101: [ma_cm].Label, [ma_cm], [ten_cm%l], [stt_rec]"/>
      <item value="11---1: [mac_dinh_yn].Label, [mac_dinh_yn], [line_nbr]"/>
      <item value="110101: [ma_bac].Label, [ma_bac], [ten_bac%l], [stt_rec0]"/>
      <item value="110---: [ngay_hl].Label, [ngay_hl]"/>
      <item value="11000-: [ghi_chu].Label, [ghi_chu]"/>
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
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3cUSXeTZYZV+H7Fxc7qoNsKpGFZ+PQutS084Ea0q9wzQfANk1EldVGT89Rsy2cBIZd3mGPeRtPTTxsV9KTNLezXBQfgcn9yPMaBp9YHBryx0/4jAksZ39qrO6/b61NArV6dlDeJpPjFuU89hdZz09mPodupiDk4ZsDY/LhBIRpPXif9IgWcl6ZBXlYzHayxc7ZcwR5p7sXsvRLJlee10bpVPtg5PZefeik/R38T98UUyicPb+zieCuAN0b7Ceu/B+8G/ytae9OeacB2ZRUNR3IisHmJykmWJAkZ7GzP0wunnRYSwNjIz2XpIw+P93Tq1mE</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz6aBk6sDGBDHgaGthtV95WGfW/cJmTUbNUjPXb75Dcg/oG7mNRMmAWaaVi/p28UBA==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3cUSXeTZYZV+H7Fxc7qoNsKovvBO9ewkRO158LFOTZ3LmBYQLqkey6yJbhlfqDonXA30GWgTC09l6H8AhZlFUD2g9M3GOKcd9x2ebcYfdV0Y7rGCj/9wyUCn/o2vU3L+B3xSCQgCIEL+ICaSFGa1V8gA==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkberoa6jRl0HozQ9/2em7TRgZM3do1G6RtqacSp7r1ueBk8yIlkqtarHawSnpYHCB9OA==</encrypted>]]>
      </text>
    </command>
  </commands>

</dir>