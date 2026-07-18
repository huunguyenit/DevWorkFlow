<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY ScriptCheckGridIrregularCode SYSTEM "..\Include\Javascript\CheckGridIrregularCode.txt">
]>

<dir table="hrvt" code="ma_vtr" order="stt" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="vị trí công việc" e="Position"></title>
  <fields>
    <field name="ma_vtr" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã vị trí" e="Position"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_vtr" allowNulls="false">
      <header v="Tên vị trí" e="Description"></header>
    </field>
    <field name="ten_vtr2">
      <header v="Tên khác" e="Other Name"></header>
    </field>

    <field name="ma_bac" categoryIndex="1">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac%l" key="status = '1'" check="1 = 1" information="ma_bac$hrdmbql.ten_bac%l" new="Default"/>
    </field>
    <field name="ten_bac%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_vtr1" categoryIndex="1">
      <header v="Nhóm vị trí 1" e="Position Group 1"></header>
      <items style="AutoComplete" controller="hrPositionGroup" reference="ten_nh1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1" information="ma_nh$hrdmnhvt.ten_nh%l"/>
    </field>
    <field name="ten_nh1%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_vtr2" categoryIndex="1">
      <header v="Nhóm vị trí 2" e="Position Group 2"></header>
      <items style="AutoComplete" controller="hrPositionGroup" reference="ten_nh2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2" information="ma_nh$hrdmnhvt.ten_nh%l"/>
    </field>
    <field name="ten_nh2%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_vtr3" categoryIndex="1">
      <header v="Nhóm vị trí 3" e="Position Group 3"></header>
      <items style="AutoComplete" controller="hrPositionGroup" reference="ten_nh3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3" information="ma_nh$hrdmnhvt.ten_nh%l"/>
    </field>
    <field name="ten_nh3%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="stt" type="Decimal" dataFormatString="####0" categoryIndex="1">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" categoryIndex="1">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
    <field name="ghi_chu" categoryIndex="1">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="hrctvt" external="true" clientDefault="0" defaultValue="0" rows="124" filterSource="Tidy" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Chi tiết công việc" e="Job Detail"></label >
      <items style="Grid" controller="hrPositionDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_vtr, ma_vtr" e="String: ma_vtr, ma_vtr"></text>
        </item>
      </items>
    </field>

    <field name="chuyen_mon" rows="3" categoryIndex="3">
      <header v="Chuyên môn" e="Speciality"></header>
    </field>

    <field name="ky_nang" rows="3" categoryIndex="4">
      <header v="Kỹ năng" e="Skill"></header>
    </field>

    <field name="quyen_loi" rows="8" categoryIndex="5">
      <header v="Quyền lợi" e="Rights"></header>
    </field>

    <field name="nghia_vu" rows="8" categoryIndex="6">
      <header v="Nghĩa vụ" e="Responsibilites"></header>
    </field>

    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="184" anchor="6">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="110: [ma_vtr].Label, [ma_vtr]"/>
      <item value="110000: [ten_vtr].Label, [ten_vtr]"/>
      <item value="1100001: [ten_vtr2].Label, [ten_vtr2], [cookie]"/>

      <item value="110100: [ma_bac].Label, [ma_bac], [ten_bac%l]"/>
      <item value="110100: [nh_vtr1].Label, [nh_vtr1], [ten_nh1%l]"/>
      <item value="110100: [nh_vtr2].Label, [nh_vtr2], [ten_nh2%l]"/>
      <item value="110100: [nh_vtr3].Label, [nh_vtr3], [ten_nh3%l]"/>

      <item value="110: [stt].Label, [stt]"/>

      <item value="111000: [status].Label, [status], [status].Description"/>
      <item value="110000: [ghi_chu].Label, [ghi_chu]"/>

      <item value="1: [hrctvt]"/>

      <item value="110000: [chuyen_mon].Label, [chuyen_mon]"/>
      <item value="110000: [ky_nang].Label, [ky_nang]"/>
      <item value="110000: [quyen_loi].Label, [quyen_loi]"/>
      <item value="110000: [nghia_vu].Label, [nghia_vu]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130, 0" anchor="6">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="566" anchor="1" >
          <header v="Công việc" e="Job"/>
        </category>
        <category index="3" columns="120, 30, 70, 100, 100, 130" anchor="6">
          <header v="Chuyên môn" e="Speciality"/>
        </category>
        <category index="4" columns="120, 30, 70, 100, 100, 130" anchor="6">
          <header v="Kỹ năng" e="Skill"/>
        </category>
        <category index="5" columns="120, 30, 70, 100, 100, 130" anchor="6">
          <header v="Quyền lợi" e="Rights"/>
        </category>
        <category index="6" columns="120, 30, 70, 100, 100, 130" anchor="6">
          <header v="Nghĩa vụ" e="Responsibilites"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwcQLj2u5fwq3g98MS4ATNu77Lt+IKFlEN+/BSU1oCDvWx0wT0bOX1/91VgjLFlxWpY=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYaR/nSKHdpEAhLF1HtRMY+Tb66xcHUH4dimVUDdGZgbhvUZ5P/z9Ic4RAPGf7Yuhko=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulixeOvpCDPDL7dSXVRsy801a4iXDrURIW9rXt/QtcXGmbp6Trt+xA067F5eSLakAPXMmWXAi49/sickHdaVCRkkju/FvwVl/fZloLVPwTXo4qFOwVwBPZwaYDSU1nEjMPAguFu2kV1kZS0J401RZnR81wUgnCP5HbbeoEUiAQ+X20vwBz0PM9V30ZRT5WJeZtXkbnEqhytdJRGsxJcaGwKjn2mwXhqg/rdoWl+VB44jWddSdwJsp34ZAFYCBD36wK84NhVAYE9pV2x4kYOEUbKybXvtaxlgp5ho3lVrlh/7Thughrq/FPi11IKVDzU91dm6u5Jt5/uqWgyo/969QR47kKXnU/9Me5lyotU59SkbZ0=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Ry5VjAbgrbSh0bI6OR5iYGOqsP+MDK7OcvFqRrCtbb3C2THxMAkJCutprG7JBeQ6wj2UHfdCgqK7f1x5Y4da+m8tHM9pL4tBSC4kZFuxfoYhSARiOvz6b8l+tOeL6yXrel3GfvX/kAKMjeSP868Es3zg95kD2bkRE9Hv+wCDF7k</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n1wt9Y7jyqHt6yLirD31uAR9dRJE6g1nQlnDK8cnjI1uPmtRqhoGj2uv/f30xkMdyKWbGnykC6C8d2jS6paW6bXWT06CNwQ4Hda1TP+T2Db2lO07ch8ovJPyHmLULqUXPYSoKvuYC7sIqDWv0PN10HYLdFfyrWvOUYXJqhSIt0b2vrKg22eLpRtoDWa5JHqzbaZp87PtDe0Y6WB/jBTW4UHv420Pv93RbppqlmCQJQYTY67g7U05io0oL18OS91DO</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwmYLZv7DP4WbpXTFtN07k6LwfXTxn6NA9jFZiNWF+Kuyd58wEkecoQojLKfVGz1Rw==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jbU02wYXb/zc0uolAS3NcmSVC7ICtLZ1sPnmQSziq6nVEZH79wenLDUagnoUo3SVwbAsksjBrc+JCS9c1sEsu2k+5OeaG2asVjGpgcAxudQk2X2L9fDon/A7EHeCHjnMX5WGNSRsOdRWOHuUcdjrVDY65S8SZ3RtOleHe6y8uEtoJK7fF0SlfhCDpLnKL+e0kZ+gzI6uww5vHnxRvI8/1/8F4wUaR2MBuNwxDYZ7KUd+LheR1SFZRBNlB1scnw7BjBrp9X52GlONhWT4E8Y3DiJ+13kXrBG+7XLmWvCuObXhLfgsduHenCSg8tapqED4wHYXLbMeh9sQzSjYip3Zxzg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxYa3hzQUcpYUJVy6SHWk9XbhoaAOSMUmyik6eFAcg2JbDy7jDJKOJl/vz9TJ2or85qqVE0aISlx2KGbv3ToELXk0TB0r4dtMJRCzqfnTSNe/+h/YADSRYg1av0R9VBESKxDY+Lw5HyEwCk3oEVOtaSj1Zl2daWeAzNMMRIn910RCAn4WQHTLiJgc6RyVXQehQ==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KOm49ISkBYHP15YooL61OI47nMIScPQAQYZGg2RiHx0wkGyT+Iv0ZWJOAbvb68dNWG9d60d1yqseZjDSru5uurEY4oTeXQwyZnTS2LHDjsy+gKJ+I3EjIavik6/Xiz8PbzvEohQFH5xiaZdk0DShlyM1xSIaiDNRqWR1BsJofrSHFcXjZApXPuuRn06017L9islBuwBYYnHIsXKlDVgiwfZ1Ntkbay3SFYfl5gb/PTlTuJuDzb4VekmJWYUG+jFxC3PujYVXox7yzCG3pQnM7KMgxh5+6wZLy60cOTi6Wh8TINnixDLSWCk+uhh9E2Oq3GCVX5eoB3p1bOiEB5eFFOu0WqAX35ZeWFEFu6q1zzmDiE434V553nr6TdFsky8M/ly7uhpCFJEGRjMwzIqVgzSzPxsg4KFtTZR5AcJI2+AORG0NGePFrjCptv6PEe9ONxnQfO8vVtns7KtJaAqWF3P6Nit1HbOrpELa8lIdjEgHt/LYIiRCCD2ZKw0AdZMFHDoMC5kyeq53ANJXLsCjaRg0MhWQ9p+FsC/enRTu/f7+JD8+T7nddXLMD0qFKzFL2cFKPBstjhNX6St9iJJ9kLlXHw3unGnq71/RX7lY3mHvjZlw77597VtVaUkUhd1Tzv6LQ3QdISNuwmB58gDBrF3NPTqAJeIoTbrY1CQVV6mYdo7ssl/eHwhGbYo2goHC4xpKDrTbr0iXi2k0qBl0jjqFrjsjHt8MS00GM8whg+OPNY98KRw/OC0Tdm0ZpPAgAAILPIV4qapgiiSg1GMs945qZnEa7swgZCB5uvT2C8nExf5PG7W6CI1sPcNPOzbGRiaRkZa1vgUz63JYAQqxiBPW4zn7RCAWsSng2cklOF+BUawGQAbNCV5xI3WBA7m7qqeljn8APXTU8Sb4RugjU31tlt8odVXdTUlmL6ciyYue8jXmxnni7eKwf/l6YTag0HW9pQcixn1InpBTJvc7DRh5qnqyW+H1DufEBoPLSNsFG+JeIu0zBVAlH3Y4/ThektEoCRsxmOcXYy2wX1okYflZYHHEQrMFzNVai371iVM</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkb1SlQ8dt7ACyTOIIkti7/3EUEP/f96yFkeNkMjFczU73dFrFgVngow1bsjD755wAEsbI65Nt1dXdkrILaMpFp+q4vebKE/+73G8kxpU/5Y2x3GDz5h1Kbol8Q/Kh2Eb5NxOBU5te+C4zeor4rS8I2Zzc+3s0kN/Ugcen6YE2fxxGzoCeHZ3zT6hI/8JkneArwl6rW0I2DR3HsmvBlMYje0zOd6tByxoQtKPek9fysITrCbfVU6/DPIykl7VF9j9nTiJa/IhUz2POp6ne7S1273np39vNqDTmtHGcdeLqjVHGogQqkiW+/AbbJPMv83zO2BU+WB4v8qbY07nQfLXRIQPkRhmYvVMWdAObXlR0t+s8RvPRTMRVVPZSK1LIlz07iPbYcQmA+g5r0SMV0BG5slJfg1RrFCjlB6NeslF5MQAw10B+CNdd9z9pY00Cwa73i3K0Pi1TF0Ak4nHwxyJPPDnd3UpGb/+jvKZJCf24tvTdZAw+uaYDrCJjT6fWj2FIA=</encrypted>]]>
      &ScriptQueryData;
      &ScriptIrregular;
      &ScriptCheckGridIrregularCode;
    </text>
  </script>
</dir>