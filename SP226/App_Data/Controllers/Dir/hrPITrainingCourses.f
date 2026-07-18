<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY CommandWhenBeforeLoad "
if @@view = 0 begin
  if @@action = 'Edit' begin
    if exists(select 1 from hredt where stt_rec = @stt_rec and stt_rec0 = @stt_rec0 and tag = 1) begin
      select '' as script, case when @@language = 'V' then N'Bản ghi này được chuyển từ phân hệ khác sang, không thể sửa hoặc xóa được.' else N'Can not edit or delete this record, It was inserted automatically.' end as message
      return
    end
  end
end
  ">
]>

<dir table="hredt" code="stt_rec, stt_rec0" order="stt_rec, stt_rec0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin các khóa học ngắn hạn" e="Training Courses Information"></title>

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

    <field name="ma_khoa" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã khóa học" e="Course Code"></header>
      <items style="AutoComplete" controller="hrTMCourseInformation" reference="ten_khoa%l" key="1=1" check="1=1" information="ma_khoa$hrdtkh.ten_khoa%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZUVGK7J+VjY4kNhr69Shlub+c+4DAFgCdI6eejjoN6FIHhPl5X0ad6ShNUOaHB1/Fg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_khoa%l" external="true" defaultValue="''" readOnly="true">
      <header v="Tên khóa học" e="Course Name"></header>
    </field>
    <field name="ma_mh" external="true" defaultValue="''" disabled="true">
      <header v="Môn học" e="Subject"></header>
    </field>
    <field name="ten_mh%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_hinh_dt" external="true" defaultValue="''" disabled="true">
      <header v="Loại hình đào tạo" e="Training Type"></header>
    </field>
    <field name="ten_loai%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvdt" external="true" defaultValue="''" disabled="true">
      <header v="Đơn vị đào tạo" e="Training Provider"></header>
    </field>
    <field name="ten_dvdt%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hoc1" type="DateTime" external="true" defaultValue="null" dataFormatString="@datetimeFormat" align="left" disabled="true">
      <header v="Ngày học từ" e="Training Date from"></header>
      <footer v="Ngày học từ/đến" e="Training Date from/to"/>
    </field>
    <field name="ngay_hoc2" type="DateTime" external="true" defaultValue="null" dataFormatString="@datetimeFormat" align="left" disabled="true">
      <header v="Ngày học đến" e="Training Date to"></header>
    </field>
    <field name="so_gio" type="Decimal" dataFormatString="### ### ##0.00" external="true" defaultValue="0" disabled="true">
      <header v="Tổng số giờ học" e="No. of Training Hours"/>
      <items style="Numeric"></items>
    </field>

    <field name="diem" type="Decimal" dataFormatString="@markInputFormat" defaultValue="0">
      <header v="Điểm" e="Mark"/>
      <items style="Numeric"></items>
    </field>
    <field name="xep_loai">
      <header v="Xếp loại" e="Grade"></header>
      <items style="AutoComplete" reference="ten_xl%l" controller="hrTMGradeList" key="status = '1'" check="status = '1'" information="ma_loai$hrdmxldt.ten_loai%l"/>
    </field>
    <field name="ten_xl%l" external="true" hidden="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="dat_yn" type="Boolean" clientDefault="1">
      <header v="Kết quả" e="Result"/>
      <items style="CheckBox"/>
    </field>
    <field name="chung_chi">
      <header v="Chứng chỉ" e="Certificate"></header>
    </field>
    <field name="ngay_cap" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày cấp" e="Date of Issue"></header>
    </field>
    <field name="ngay_hl" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Hiệu lực từ ngày" e="Effective Date from"></header>
      <footer v="Ngày hiệu lực từ/đến" e="Effective Date from/to"/>
    </field>
    <field name="ngay_hh" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Hiệu lực đến ngày" e="Effective Date to"></header>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Description"/>
    </field>
    <field name="ten_dt%l" external="true" hidden="true" disabled="true" defaultValue="''">
      <header v="" e=""/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101001: [ma_khoa].Label, [ma_khoa], [ten_khoa%l], [stt_rec]"/>
      <item value="1101001: [ma_mh].Label, [ma_mh], [ten_mh%l], [stt_rec0]"/>
      <item value="1101001: [loai_hinh_dt].Label, [loai_hinh_dt], [ten_loai%l], [line_nbr]"/>
      <item value="110100: [ma_dvdt].Label, [ma_dvdt], [ten_dvdt%l]"/>
      <item value="1101: [ngay_hoc1].Discription, [ngay_hoc1], [ngay_hoc2]"/>
      <item value="110: [so_gio].Label, [so_gio]"/>
      <item value="110: [diem].Label, [diem]"/>
      <item value="110100: [xep_loai].Label, [xep_loai], [ten_xl%l]"/>
      <item value="11: [dat_yn].Label, [dat_yn]"/>
      <item value="110000: [chung_chi].Label, [chung_chi]"/>
      <item value="110: [ngay_cap].Label, [ngay_cap]"/>
      <item value="1101: [ngay_hl].Discription, [ngay_hl], [ngay_hh]"/>
      <item value="110000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHZqLQHvIqLTJUpo+DWhlymlb0f7glYOme62xjmIlCmOsw==</encrypted>]]>&CommandWhenBeforeLoad;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5faFui04G3amZ/UcZbrdJfeTy3SmAQWfRU5VMlwmFnfbTmQaKN/kpLzhDWvXFGVm8xEbttpnnlEebyG+7p0Ey04hVtc/z3QUCQfRykwNeH3mJizWvdXmG5DumJS6+lpqrq5mCWDWCiCtCPoHN02jbY=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHZqLQHvIqLTJUpo+DWhlymlb0f7glYOme62xjmIlCmOsw==</encrypted>]]>&CommandWhenBeforeLoad;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5faFui04G3amZ/UcZbrdJfeTy3SmAQWfRU5VMlwmFnfvjpsSxnSn4fmurvqkKiL0nRAioZ1GHbBAY7x64hnamV5v9cNJpENMeA39CAQi+Rjeby5JapiXYrqdO5YzpR8lQ==</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Z7LHZIp92czZ8ScTkAhYeT/bB1TxFyNUae3dHe7oNsbUGHXWNkNXNetBwUdFqs9XXklNPRkYc8zlXA74/4yCi6zZvKj+mihHBw2EMIZEK7O4u8e/pKsnNYDl7v9fA0Cc/IxQ6eeUHuCXvDP63ISOcrpzXTfPVTe4NxQosKPzRFvoqiuKPeAShykRrKi+2sbVQgG1bEeeIT/sp9LMHvWw1hBBpqfpbDg6YBATWN0/gsKi8EcoQAVCKovC6HcZK9e8CPrLlnxYg02EHEEylu5laNIRBgyNSH+8h9T86JVn+n0KGuFRZGyvoBH3A28q+rj+ejHc/8Z8nbiTLkx8maa0pBN0K1SsRilawAHa/oR0y00xmpyuzqjP2lxqr3+cnxqiQ==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf75YByFT+3fhEakw1U1JNbN0iNII5ZKtXZ6WNaazVvExm47YKgdL5eq78A9SCrlph+IBvM2yjaREAeuLns+vKWmhNlDH2Mo50nyFVuxYlr+A</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VMGnAuG6TZuGi7IHA4qURqb5MuiIPUtActJgFUc5FCyRksD1B8RnPfnG/s2pcHb+jFKbHj+HFyBLwhJ0IPUkwtj8EcZCBWGvA+1yP/CApeKyyalOWRM1vxxHLCYLo4XWERa76LODYa4Vvl/58Q/JcDTfsoMySv780FkxMvWq9OMhlnm9C2IdBMGZEpsEhiAJypYzYfhbaHYS0myPK8MIZ2jDj6Vj7JPnr0sadIS/ogBeR9O23PY3jci8to6Wy6TlxetIqyzHtiR8pt1EE8Fd1fumaiulAP8VRnx1OEbjutbIGhNsH0rXvIOH1iZ3PrcLypuAX7i5Wr4KZsHD8n7TTUGn05QFdowpwk1aYLSPIVVmkXLnqnVINPwOQpByxd0cMh+3Rd8FNa8eaBxqwCZsboVpm1XirTWktgh/lWBqPZU79Qv3d8OAqX0XJOCqD6UkG5zUS4zqR6F67D912v+H4FWwrpKE5ubfuEwXxqbEJzF</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3cUSXeTZYZV+H7Fxc7qoNsKn5cpszIRyg7YXUnNWxg5MPX0sGCwr8xgWLSvyATOBmb0iCDeJIHIG4dhl9nO5M2UXuUmPQtFFr6o8AmMzWRxyFmAq2zq/gjTwMx5ziFN0vs4YwkrkWnJLG/gUT0WObrPC16OwHV/1/JKRZN6Z6Ayv68PsJCfET8ARqwuAub9GWS/9oHv7JgVt/GLeknXwRnuRWBWdu2rMYk1ZqzwPDxXAOmMC18fnVXXjraXezm55iGT3y0UY/8eiUjEOix0CBRylMrc8JPo7oWu6QkqyexwMSUPZNHYYw0p5XHg8gDwi+odetRkHa5oj8HaanpR6oN3Nynlm4pfdmFRpz4LALG1uo=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz6aBk6sDGBDHgaGthtV95WGfW/cJmTUbNUjPXb75Dcg/oG7mNRMmAWaaVi/p28UBA==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3cKgN7ZFfGg3n8DUtGu9xOfIvz7YFF5xPf9JYBe1HA7SsNfsZxtc2QlgqXbD/EKG4FkB1CDm/A4DfiismgxK2ElucDgDnkxKwW7OXzpHt6KG5cjaab0AtySIFyIW++/lJl/u7erDDmMNJd5jw8i1BYly19j+FmAdDltUhictVlhco=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkberoa6jRl0HozQ9/2em7TRgbBZxVK6WrbqdOuCgmrhBxuF3eRyTeBrlEW2m4lrGyOrQ==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK524JaPBgZ/c9qLmxfuK7a6+Oz0KprFI9We2eCL3aURS55QgKn1r5hh9oHTtudLS+8QupbAbhaW2BOFmfi/g71pReslHHC3i4jvt76JZ3Nx2pEMddnpooY8PYsdndliRtS3Wf2zEPjwmv742OB/2yYY</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70H7ZXjZXrDeYYEaRc3/EV3g219UNSAqpP7zVBFOmrt+TBWIeFAy3neBE73VPAZc34grH8elTs4/UAIoKZwREv1ibgzQBE3IUVjrZ3mcJbePk7cqsHlHFlJVmqLBRkbCFIXn/y9okLb31NUsY2F3zCkPKfy82MoVfE8u811JEIU4tPALqo+FRjTyLTRXdQxuDSxAgF0u7wjueLJWY52xcJNXB3mIUpchB5YF7eyei99FYmAS2yI36FpVKQC49Lo45PBl9wl+nZBHSeLkapiqzTEdNmXiOrYvAH1wtP5eJHWrx282DUdEusDuTwf3MSnR5X32Ql9CNag2m8W3+nI13A4w5yD/0INvyC51gkUC1TRdMyPKnIkMgnaEky8BjXk4p1GvBlVF0tZT6hbat0/77ikrSJ9WsUi3qvwcSEk2R0gbxgC3mHBPQRe3TVM4V/viqkQF3SJopBMqPMjjeQUvIr1tJbJkpBGzsVHf9306qCDtfrLF5obAYvz6GEF63NO8pMZep9Crrves6grXcGwjlMYw=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Course">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK7sJh8jXuj6kOx/ezLepT4BStCcdQpY4yTiDnJMqpjORhQJ5sanhIhszrla37EoxbkIMcivQZHG4uRWKv5ArXbu7Q43U1xxO7p8H+MZuMaRb1BGLmOdV6ceu4LNTohlrEn2mYGGVWhXbdybR09AERQKIXYDpVuTtfY9gq94meytOACaTyS/HNiqMdBE3ynKRHrKTOTitJ1wozrw2mftrkxqq8G0mwtSsMrBYwFUZndSCW5aguSEmNyByviutQVIRmzcwDVxIT2BVlDVPEuC18eF8CYO3j4bDpkSSZMNFTBIoQ==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>