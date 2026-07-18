<?xml version="1.0" encoding="utf-8"?>

<dir table="hrmucdbh" code="loai_bh, ngay_hl" order="stt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="mức trần đóng bảo hiểm" e="Insurance Contribution Rate Ceiling"></title>

  <fields>
    <field name="loai_bh" isPrimaryKey="true" dataFormatString="1, 2, 3" clientDefault="1" align="right">
      <header v="Loại bảo hiểm" e="Insurance Type"></header>
      <footer v="1 - BHXH, 2 - BHYT, 3 - BHTN" e="1 - SI, 2 - HI, 3 - UI"></footer>
      <items style="Mask"/>
    </field>
    <field name="cach_tinh" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Cách tính" e="Calculating Way"></header>
      <footer v="1 - Lương tối thiểu chung, 2 - Lương tối thiểu vùng" e="1 - Minimum Salary, 2 - Region-based Minimum Wage Levels"></footer>
      <items style="Mask"/>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="he_so" type="Decimal" dataFormatString="# ### ##0.00" allowNulls="false">
      <header v="Hệ số" e="Coefficient"></header>
      <items style="Numeric"/>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 20, 50, 330"/>
      <item value="11100: [loai_bh].Label, [loai_bh], [loai_bh].Description"/>
      <item value="11100: [cach_tinh].Label, [cach_tinh], [cach_tinh].Description"/>
      <item value="11001: [he_so].Label, [he_so], [status]"/>
      <item value="1100-: [ngay_hl].Label, [ngay_hl]"/>
      <item value="11000: [dien_giai].Label, [dien_giai]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliX76DIsuS4GUIyUtwUQIeEECX0uDgEvIPbDewpy6Amr/98i9e5+XjJrIURWzwIl2Vzy9IJdO0LEj5dJv24RmA2PqNLTDXTAQmb62islzW9VFHB2mG0cMWZ9Mik34BVsR8wtZv1COT38OJiiiHiwE/8yaAOy0NZwmRN0mel6xikETOCYVs21KWkMEwOMWNwUDdpbWBt50ieG9L6/MJHLb8lE2yIkAFze2fySHbZ8ir2BZeTlCZcT4jDflkwqAgef1UicaBp9d2jO/mWyGkOMr7A/FxrmXAsSQnCati/y4gfesEp9XSDRT8RNJL5AfX6GuUQHT7fEMxKQP3N7yKUmeRK9WYtRTz9bmKXBGFH2ra4/Pd24IEqJk4Bp9bVl00ACyKIPKgV+I0SBuSLXmIFtyBguIqzm3WTdDHaf/1tDual/rGJSctrs16lDzjRQpPlAMz</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nCfkNRHi6M/mEOBhqz0HD7TSVJDSYU+Wp7iASEMqBiOuxz1wdbFbunBlnwshfkgYDHrybk4fzYb1AVWuw9vGMBOaF4xa4D14BLu86ND0vQJ53Wr3pte3jBxd8FNWk2q05WWJ4H8l4RT9HqTeHgn9uHofIx4Kws39SF6qVMi5oQZ/DQRiNJoyGC2mx1VXlpodpk4KVwxB7bsEpQVZluGFkrnPPPKcrdk+pqBmqymHNup2z2U98ZPpHc9ys1R81arMS</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jiOhBfHQ+ZMen7E/3asYGu4DKT+H3zlmcHF8EiGO4byG8xZzLPaHbQ6gzAWUH2Knlm86YJ3gBzXKozfh4UBikcHQTOWLQfCjWqlSO97pnBqASKG4TQEPDTfEzQthJc7D337ZqlsmEB5LqAyE4/LnFMd6b16eyKSklWSTbHEdNzq1LrnuizKzKGiWhtCjrLdpxTVzNPY9GagSj4Gsq+rsA06dRH7Lg/azGCfMpRnOQxVniAotrQYvkfVQ+k+FP0jiOxozEGHppYrFgfm+auiLAHqtbgqqu5KN3SqPjbBwdukF0wUbW1ayx2f+7HeVOIgtQ</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbepToCnaWLN5XUW/OoRvI1uEf/T/ShbuWow2SlPjjRAZS</encrypted>]]>
      </text>
    </command>
  </commands>

</dir>