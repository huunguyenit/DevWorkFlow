<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmck" code="ma_ck" order="ma_ck" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chiết khấu" e="Discount"></title>
  <fields>
    <field name="ma_ck" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã chiết khấu" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_ck" allowNulls="false">
      <header v="Tên chiết khấu" e="Description"></header>
    </field>
    <field name="ten_ck2">
      <header v="Tên khác" e="Other Name"></header>
    </field>

    <field name="loai_ck" allowNulls="false">
      <header v="Loại chiết khấu" e="Discount Type"></header>
      <items style="AutoComplete" controller="DiscountType" reference="ten_loai%l" key="status = '1' " check="1=1" information="ma_loai$dmloaick.ten_loai%l"/>
      <clientScript><![CDATA[<encrypted>%44RLlF80A4PJgP4a0syZrTwEkY35LMo/9k7PxGW27jCgrsyEHG7691ux6/dEPgbv1fE4udOdLyU+/L+dm3FqMg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_loai%l" readOnly="true" hidden="false" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="muc_do" categoryIndex ="1" align="right" dataFormatString="##0">
      <header v="Mức độ ưu tiên" e="Priority"></header>
      <items style="Numeric"></items>
    </field>

    <field name="tien_yn" type="Boolean">
      <header v="Ck theo số tiền" e="Flat Price"></header>
    </field>

    <field name="tien_hang_yn" type="Boolean">
      <header v="Tính trên tiền hàng" e="Apply to Extended Amount"></header>
    </field>
    <field name="cong_yn" type="Boolean">
      <header v="Ck cộng thêm" e="Added Discount"></header>
      <clientScript><![CDATA[<encrypted>%KUdL9j0UXmUk0bVHKjX7n0FlN4xl6WzMYzWSSCJcBfPBybGi6oHDkyc1EPYuYBni0NRe3v2WanurKAv8bTBt5A==</encrypted>]]></clientScript>
    </field>
    <field name="con_lai_yn" type="Boolean">
      <header v="Tính trên giá trị còn lại " e="Apply to Remaining"></header>
    </field>

    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày hiệu lực từ" e="Effective from"/>
      <footer v="Ngày hiệu lực từ/đến" e="Effective from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày hiệu lực đến" e="Effective to" />
    </field>

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="9">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" >
      <item value="25, 95, 25, 5, 70, 100, 230"/>
      <item value="10100: [ma_ck].Label, [ma_ck]"/>
      <item value="1010000: [ten_ck].Label, [ten_ck]"/>
      <item value="1010000: [ten_ck2].Label, [ten_ck2]"/>

      <item value="1010010: [loai_ck].Label, [loai_ck],[ten_loai%l]"/>
      <item value="10100: [muc_do].Label, [muc_do]"/>
      <item value="1111000: [tien_yn], [tien_yn].Label, [tien_hang_yn], [tien_hang_yn].Label"/>
      <item value="1111000: [cong_yn], [cong_yn].Label, [con_lai_yn], [con_lai_yn].Label"/>

      <item value="101001: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="1010100: [status].Label, [status], [status].Description"/>

    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwfeAizss+XdsE7X+qQwVfx+Hldo99LEngRNOFbk0sxeg9HRSz0/yiHMVy9czJknhv5drMSon9Iqp3rnlsmD6RMJagi5klLm2Eq1uZV3NPYS7g==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYYRJP9XWUHOy4lhOpNY1Jt8ameduoDlh7Zb6cBHqccIy4QqtSxcaWN3Ntv1b0g4hFI=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5+tX/QQF8prAKY6Y9aJZXjZIyf/iuL4/FLrguYGWRuU8WXF7TjcjJFMtX16IdK5DgPKHu1lzI1mGI0BC+xg/A+Jq9a+hQmukCQ01h9shYG+</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26QcouxuwCNSv9LJumkQ/bCl7f9ks2dxMe2EiDrWRipGQOeqDmiCdekofNxWa07TbxHMhyYcgxSYvyrjOnQ7lp6hQsvasMZ21L1Sc0oG3ZZYQChaw5AobozOdpG7g+kcD/e0aPgQRnz2A+mZd6fdHqb27bovhwjTBRHca505f20jNh0XCGf11Pz6XdB4r8SRS9PQC52Facr8EKpsxDqdswIsdnRHQXR9yAOkCx4QmYg1UdHAOwff3JDx8CcNSaxhWyhtm9v+c56vudEW8zWLij8NligrVkUlJimpJRfwPEC8zb99r9ck7WQrRZzlvgBRZPFDqFTcItHwuUgWp40FRraYIuwsLr8YFPrvESa6XX2/LrlwcAQa3ymrVhSv+z+VGzYp+7wSdQAToRvcnqbUwXu4LlV/vaK/fM0OHRw45R64q/AT3v+MmxGtegKAX8AVYGCuCTymoRVsCG0c3+3S0sT/gc=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n8pKhiQa8zI/gbytW86gjs2OPr0hwo/+z3/gcZMARkFd+PO41uKvf1RFytq2PN9W5qGBX2shDtWG4WVJK5GywIKUkWo6bXqpZEVCfJNzBsGY6RxedUvEHuGCn3kdWy+va3Lv4NnBcHZ+iImfdU3vj6UhSi++uSiADxuoQD6P8BBqqAAq+DdAmuwZSXW3pEK0IuBmxVQO/2ng4KBdko735w+y270cW4mN+mNeAqA1lnCQ=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jjFxUr0B6V5+Tl35YPaqCOMA1xQcc6hnr0NVfC3vWqYmmIKw9ugO8gkijgfirDGltJEXY8SLATKcj0pFUGb7wiaIDYT83R5N6GkGLSDWJ7bNrGJUthL5ueCtgAMWfwhMZnmdy0hNjGmJX7vpme4JWBm4AJi/yZ5m7SGM7gE1mKBjLHLYglk1tVhOrVO+1mPNy4UEpCCx8kPGjGF+mjABAwOaZL1l4MCHJJz7xaOMn5WnKbg7Br/473MShIKP9kndDUgGUb+NHJzeo72gMCHLbzw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbevuZWetTb2UMsv35r5+hFl2QT4cy47xV0YlVK+2tdgYV</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkY2HBVgHC2A7Fi0NRrvcxTPuXPBuka4+4gGhjJz9vdb9IdEnUchxg/41j1v87S/E95PPNDZfE+4vk3wTor/9f1fd108EUNaohu3+EZ6JHgvLkGU6I9FFkAE+Xoxeza20SiNYagE+e6jYuvH8r34LMSFvjWa3Xr0Z8HnqDG8VBvbGaXJOe8v/uptxuS2OuAC4uoLB79iIIEdnoWTxhmDB4UF+a2gyN2KbIiwl7HtuGskdyjSo6UspOA/lJxuGHCgkPugRaxZ7TuUT2pO4wTj4RAgr9ULOKscKZn3+kOUsDP2UA8RcOfUjwb1s8P+JGtdp9rpXlBbqEJ/M+JRT5z0kU6y7kB378ePcSIn6K8m4h6SlApoja4u3qhCrSVZRQbUf4/cqn52fCjVChgyZbdJ/uEw25MEfYeUxWfhC/mJFCMA4HUDI+nDPqfzqAHLhM+LejYNC4kyBYGwy9fMKEuoC9hCpgKFHI5TnrrVFbD+e1EajXiAatUei0k7kU4nE8ncUi7WkdhA0J6krC6wcf1hrXguceUCRN6CslRudbVe2X1NeA==</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>