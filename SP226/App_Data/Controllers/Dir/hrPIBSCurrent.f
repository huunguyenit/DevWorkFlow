<?xml version="1.0" encoding="utf-8"?>

<dir table="hreqtlbhht" code="stt_rec, stt_rec0" order="stt_rec0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin lương hiện tại" e="Current Salary Information"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>

    <field name="ngay_thay_doi" type="DateTime" dataFormatString="@datetimeFormat" align="left" aliasName="fromDate" defaultValue="newDate()" allowNulls="false">
      <header v="Ngày thay đổi từ" e="Change Date from"></header>
      <footer v="Ngày thay đổi từ/đến" e="Change Date from/to"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZenKGRsQPNHq3NuwTLSlCBARWXct55ptuNutCyEkxk/kN559+YJ05in2/Ega6D95bEG/ChxXL47S/GOrhtX/76s=</encrypted>]]></clientScript>
    </field>
    <field name="ngay_thay_doi2" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày thay đổi đến" e="Change Date to"></header>
    </field>
    <field name="loai_thay_doi" allowNulls="false">
      <header v="Loại thay đổi" e="Reason for Change"></header>
      <items style="AutoComplete" controller ="hrSIChangeType" key="status = 1" check="1 = 1" reference="ten_loai%l" information="ma_loai$hrdmltdbh.ten_loai%l" new="Default"></items>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="cap_bac" categoryIndex="1">
      <header v="Cấp bậc" e="Level"></header>
    </field>
    <field name="chuc_danh" categoryIndex="1">
      <header v="Chức danh nghề" e="Job Title"></header>
    </field>
    <field name="don_vi" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="dia_chi" categoryIndex="1">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="hs_luong" type="Decimal" dataFormatString="##0.00" categoryIndex="1">
      <header v="Hệ số lương" e="Salary Coefficient"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZenKGRsQPNHq3NuwTLSlCBASLYAlarnl6XYSZd0GEawoPEjG1tvD31YWllngETr5F7d6pNYWNpqD/cBpk5LxASQ=</encrypted>]]></clientScript>
    </field>
    <field name="hs_pc_chuc_vu" type="Decimal" dataFormatString="##0.00" categoryIndex="1">
      <header v="Hệ số pc chức vụ" e="Position Coeff."></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZenKGRsQPNHq3NuwTLSlCBASLYAlarnl6XYSZd0GEawoPEjG1tvD31YWllngETr5F7d6pNYWNpqD/cBpk5LxASQ=</encrypted>]]></clientScript>
    </field>
    <field name="hs_pc_vuot_khung" type="Decimal" dataFormatString="##0.00" categoryIndex="1">
      <header v="Hs pc vượt khung(%)" e="Off-scale Coeff.(%)"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZenKGRsQPNHq3NuwTLSlCBASLYAlarnl6XYSZd0GEawoPEjG1tvD31YWllngETr5F7d6pNYWNpqD/cBpk5LxASQ=</encrypted>]]></clientScript>
    </field>
    <field name="hs_pc_tham_nien" type="Decimal" dataFormatString="##0.00" categoryIndex="1">
      <header v="Hệ số pc thâm niên(%)" e="Seniority Coeff.(%)"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZenKGRsQPNHq3NuwTLSlCBASLYAlarnl6XYSZd0GEawoKUnwNUGtvxwPOaCJ9y8qE3IHaoxNWXUhqALhKwQClxU=</encrypted>]]></clientScript>
    </field>
    <field name="hs_pc_khu_vuc" type="Decimal" dataFormatString="##0.00" categoryIndex="1">
      <header v="Hệ số pc khu vực" e="Region Coeff."></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZenKGRsQPNHq3NuwTLSlCBASLYAlarnl6XYSZd0GEawoPEjG1tvD31YWllngETr5F7d6pNYWNpqD/cBpk5LxASQ=</encrypted>]]></clientScript>
    </field>
    <field name="t_he_so" type="Decimal" dataFormatString="##0.00" categoryIndex="1">
      <header v="Tổng hệ số" e="Total Coefficient"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZenKGRsQPNHq3NuwTLSlCBDXJ9Dv9tdjPPPSAc8JB6HSORAqRtHvBxrZpNO8W2t28nV8NHzh0VzvIWv7Sg3ZgRM=</encrypted>]]></clientScript>
    </field>
    <field name="luong_toi_thieu" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Lương tối thiểu" e="Minimum Salary"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZenKGRsQPNHq3NuwTLSlCBDXJ9Dv9tdjPPPSAc8JB6HSTmRUat+q/5/PihuORtNj6HcK1Kr9ETd9Al3hdUPbd0A=</encrypted>]]></clientScript>
    </field>
    <field name="luong_co_ban" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Lương cơ bản" e="Basic Salary"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZenKGRsQPNHq3NuwTLSlCBBmfikf2oKN130N4N0DK+NewG0Y4UBH1YgbPXVW+dQ0tp01uLsLG79Qh9OYpWlunXY=</encrypted>]]></clientScript>
    </field>
    <field name="ty_le_bhxh" type="Decimal" dataFormatString="##0.00" categoryIndex="2">
      <header v="Tỷ lệ đóng BHXH (%)" e="SI Contri. Rate (%)"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZenKGRsQPNHq3NuwTLSlCBDvnxRVTYWLAYpCS5sTtvEmqC5Xtfyr1NC0f+E6zS1HixDDpuIIqS4LlnBBhBnd6R0=</encrypted>]]></clientScript>
    </field>
    <field name="tien_bhxh" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="2">
      <header v="Tiền BHXH" e="SI Premium"></header>
      <items style="Numeric"/>
    </field>
    <field name="ty_le_bhyt" type="Decimal" dataFormatString="##0.00" categoryIndex="2">
      <header v="Tỷ lệ đóng BHYT (%)" e="HI Contri. Rate (%)"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZenKGRsQPNHq3NuwTLSlCBDvnxRVTYWLAYpCS5sTtvEm7sobr9IKAaSpbhRvaUbuKs7/FTYhydn45pAgKYtspZA=</encrypted>]]></clientScript>
    </field>
    <field name="tien_bhyt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="2">
      <header v="Tiền BHYT" e="HI Premium"></header>
      <items style="Numeric"/>
    </field>
    <field name="ty_le_bhtn" type="Decimal" dataFormatString="##0.00" categoryIndex="2">
      <header v="Tỷ lệ đóng BHTN (%)" e="UI Contri. Rate (%)"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZenKGRsQPNHq3NuwTLSlCBDvnxRVTYWLAYpCS5sTtvEm8Ft4qG/g2CxFmiiWUs1PEE4emsXGQ/lShGv3D0+aWTY=</encrypted>]]></clientScript>
    </field>
    <field name="tien_bhtn" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="2">
      <header v="Tiền BHTN" e="UI Premium"></header>
      <items style="Numeric"/>
    </field>
    <field name="ty_le_kpcd" type="Decimal" dataFormatString="##0.00" categoryIndex="2">
      <header v="Tỷ lệ đóng KPCĐ (%)" e="Union Due Rate (%)"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZenKGRsQPNHq3NuwTLSlCBDvnxRVTYWLAYpCS5sTtvEm0DbI+UYV6yuMsb7yWXG5KqXU4mPAXbGzHSs2ZravJy8=</encrypted>]]></clientScript>
    </field>
    <field name="tien_kpcd" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="2">
      <header v="Tiền KPCĐ" e="Union Dues"></header>
      <items style="Numeric"/>
    </field>
    <field name="can_cu" categoryIndex="2">
      <header v="Căn cứ đóng" e="Payment Basis"></header>
    </field>
    <field name="ghi_chu" rows="2" categoryIndex="2">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="256" anchor="8">
      <item value="120, 30, 70, 100, 100, 30, 100, 0, 0"/>
      <item value="1101----1: [ngay_thay_doi].Description, [ngay_thay_doi], [ngay_thay_doi2], [stt_rec]"/>
      <item value="11010000: [loai_thay_doi].Label, [loai_thay_doi], [ten_loai%l]"/>

      <item value="110000001: [cap_bac].Label, [cap_bac], [stt_rec0]"/>
      <item value="110000001: [chuc_danh].Label, [chuc_danh], [line_nbr]"/>
      <item value="11000000: [don_vi].Label, [don_vi]"/>
      <item value="11000000: [dia_chi].Label, [dia_chi]"/>
      <item value="110: [hs_luong].Label, [hs_luong]"/>

      <item value="110-101: [hs_pc_chuc_vu].Label, [hs_pc_chuc_vu], [hs_pc_vuot_khung].Label, [hs_pc_vuot_khung]"/>
      <item value="110-101: [hs_pc_khu_vuc].Label, [hs_pc_khu_vuc], [hs_pc_tham_nien].Label, [hs_pc_tham_nien]"/>
      <item value="110: [t_he_so].Label, [t_he_so]"/>
      <item value="110: [luong_toi_thieu].Label, [luong_toi_thieu]"/>
      <item value="110: [luong_co_ban].Label, [luong_co_ban]"/>

      <item value="110-101: [ty_le_bhxh].Label, [ty_le_bhxh], [tien_bhxh].Label, [tien_bhxh]"/>
      <item value="110-101: [ty_le_bhyt].Label, [ty_le_bhyt], [tien_bhyt].Label, [tien_bhyt]"/>
      <item value="110-101: [ty_le_bhtn].Label, [ty_le_bhtn], [tien_bhtn].Label, [tien_bhtn]"/>
      <item value="110-101: [ty_le_kpcd].Label, [ty_le_kpcd], [tien_kpcd].Label, [tien_kpcd]"/>

      <item value="11000000: [can_cu].Label, [can_cu]"/>
      <item value="11000000: [ghi_chu].Label, [ghi_chu]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 30, 100, 0, 0" anchor="8">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 30, 70, 100, 100, 30, 100, 0, 0" anchor="8">
          <header v="Thông tin bảo hiểm" e="Insurance Information"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ePvDEiPLJoZDJnB0zrXDohsLBM8Lgksb8GVuemiyFcXNL6skLTMfV+iSvXz4BLSLjPV2p/FMQ8Inm3QhpYh7cWeaDiWQxf4r8b8uoV6fKC9mDB5Z7k95mUKe0xFl1erNLoawXThMtS85yHbheyLptElqj/ogVAOwtSbw4WW5gT4N/Adn5Fb4pQvpA0dXZFDYoUJj1O7tZaLYX64coAakHgnF08Sy5nyYJydFGtRnXf219//xtyBhISeeDw+yM0ogu5a++QUL8X4rp4u2SI+Jh41tbwhcpHbm3UDe/hfr56Wi7bwrdw3V7x7qV3651YbcijhAPBQKPp0JQ62VOCtCQ24k1GZ8ugY408otpX8JVJLxPE1zLQDDGa+jvh8ZWGWa50p/wYsqcKQhlyEAsVVIvOePX17n+qhKpX2XEssEGsK</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%PqkM3HnrVADZFaHe07aaRaSoDLWuk1fz5yC64DMhrjpFeM+TGtReWMTX0QHoNYG+i8sRSeea7bGU4dC63nWDnmLJy2+uvcpi50vFyK5jHLLylox/CyV7Q7TqA21bWDiC9iqNO+VUdLTG4c8hKYjVUg==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSd015zqG2qd8QnyqXq+4m2vPQYKUCwrUFGjFHlw391K11WrmjEgBw/pvBo90LDBDkPbrwpOW/IoVCzI7/tocHpjywttFN1vV8CbscFp4ERuJdhmZzvE/1H9hnujM2zWCyhnIl6+S5e5WG98VhFopAdZyR2CyDBjf5DPmqIleCPb+ghhZ8DlfjHTUtUWqIV98eMd58gSaB6OBdqGgM+y1pcV0ffdQUGC6SGdbX2Unj+htbaLSOXvFbx5FE82T2voDvpvF5/dzpU+8BX+lxvz6M9AdVltGLYF5+e4Rjvzg6yyI/OPalBZwIuiOaEeuIdkNkEKoVyy1D+9cN5E3gK3rO7snEjBbLy+mx6KN5UIompbpQuJg6VhKgxZaAxFNTQFssfP92D1vJXPiOnPgC7pkaB2NYDHyuQePkwqhaOpyt/V9Z8clT3fqf+5qQAFO1pQ5XDHrE6Yg+MxSYcYNPiw4oY</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3cMa+m7mA+GIUXOze1M56800vCvqtNWOmGYaPuG/SJvn2mgi8H7DyhifakAVZGj0LPxzqFJm7hfs/p3dUhW/yz5g+rDdMuvGoVVEnCDYcHX9JnVIjbtaIDY/LZvrmX/hhk3BpcNBpVKho8W+PkIYLk9/kQXvDdZfya90SECyU4ZA7EmipI2WMea7rKYuc28x79iSXKxKNwHaAu3+hjTH9kejTXvKDmBG1cRUdzKyeHEqTlhDTWuNJ6f4sBF6R6RyHOijYdSDTFAjlHFefs3eTZDxSy/E+cl14ANt1Yi4VHC+85ju8Ew+1zLE5p56M28ZGVLH0FX0BRkfL50BgpiUVB0I+1EG1NXAprV4INVwnm29fTvLlixLAdlpYzdGEsjgZOE1CZLKMVHnsc+7aeMRdyZA==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz6aBk6sDGBDHgaGthtV95WGfW/cJmTUbNUjPXb75Dcg/oG7mNRMmAWaaVi/p28UBA==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3cKgN7ZFfGg3n8DUtGu9xOfC4vcCyYCXFG2deeQMeN5EYowqKWtnOSxWEDOFO37jG8AL35cE2aKzzC2Pzt/8Nqk0GBudx0u9/Yc3vwc/+3ONDno6KdYGb5Wp7AzoJ707hDsToBFs7HDLSvQneBtIWrC2MeGw2/vEmVmA34coCaGTAt0VzoW9Qhm/tOq2Ow7lU+GVMq3cGX1pAHpiAPy0px7UXvH7RBBmzvshbeS0MuGko=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkberoa6jRl0HozQ9/2em7TRgZM3do1G6RtqacSp7r1ueBk8yIlkqtarHawSnpYHCB9OA==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxeW4+tyais7Rn6lpWVUOLgHtJ3rSPjYzaFej8AZAjxoAiXsUpf5g3uNtLZng+Fh78jJUQXNtjYTa7Uw2H3htWw=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KInAnqcXJOY1YJQqLL4krhl46OH701sAJ0MiCdr1ukk5ka8UBqYnEyDtJu4zi17ns7CG4UGoWuzvQJ+G9Q4sp3RnOU/XW4OgxZAdfndZ+q/WMyFLgR0q2n/f19EdQeVhMTrHUafdl+axeYeHeqSm1OkZGBv0SM/A+do0EeVCT1aRFJ08dlCJePSGVC6epd+tv+qPrDDS7CSrmUT8zm0rsRVkfAHMISIMDs9w1+U5DMzMIPa1f5AU6xvne60yd0/hkvXpifHhDsr71xBsqWB11bUR7lUsbtACi7G8QqWCWpse1waMt762wZNM4rZkKqK6spOXexRuP4PcosDkdRWInxexnbyDhkuguu3/td4kHl7Q6M7wNsqWNPORwRPP+h49A==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%cuXNkLI/9J0no/A5pPbabpv6ieE58IoCY+fCBhpw+wzqqWLFlv3MhJljgKapsDdnhQEmt/gKblxyXBg01JBX98fVyRVC7dbSnZ9UtAZoxW56i/4a+3L9yQm0vN6aNI1EyI7PltTXXDuMebXY2yZh8J18ToH18cBpuNfrCSM7Z3rFW84ihP+o+V8pH7EfxaA0m1IxcLIbwUkaOGnOkwLhRLMYx7Lx4ArM/mwKAc7/JEvpoPDblYEgsFsihLNWYRKwxct6hk4SS3y0uqXgekbN6LNYzNVI6Vshe1EKkpmRANQeTTkOafPVMMed3+P+d58wQLi8E5Ii71m7u9fHgV3+Xta14S5pnS1vakz4JCLmRyUlcq0ApV5WoXjVtokZglt0U1MyoM0LslRSAjRUfuNrdnlk4yAJncHOW24MuwWHkX6FliYt4eCnpRyuqO6EVpoiukJKl5VqTElwFOVlkapYtfrB9V6MGkic1bByAijk0tnzF5fz42roWz/R9jIYHYwXfzscohoGAohs6uYroCX+T297MmxCTa3tJYim5qflw7LA0IldehNVvBYqM49X49bGX+qkMP5hg+EvX3KkfI1zgXbXeTI6UnIGAdxL+JT+FrIh+Fs4ZHZO7OVVlAFuv/UtGm4yqv647whPwvFRzJ/tg+lDf9+dfwV29/XaXEJ0SqkdhowTsFXRA8CxeUdBPMUNMVepknN2LbuwuCMEC7wqGmiJbf8jDDkaQoB0bPOApFBUsJosgZtpp5KMRvORVdrOteUDuM+fjoGYZWd5XiPm9cgp/syue+wQ8PMvhzYXiwN1dPMIZcOpAvEhHmLAsk72ELEglHD9GAGcFTFtY4oaY7pSZn4bkg3t4pOVY+bnGrnVfJ3Daa+L4c2i4QFVPamarWd7hSvMOcXLa51S2iVjuAA55wJjLrLL29+8L0EmLD+QfgIChvFkY/Wy604fkeQtvRWWbUw1TJeqbSOU/zohLNcW0LWHm5RdkhPEO9AmnYabij119L2hckaUETf21nHDXiTqP+2pqIElIt5dHcdtPIK5V3Oo/SSbxNhTu5mm3UcFL+d0iMGH22iVeBTHeGorXuX0idf3DMPbmSi7pVYDJ5dVrPQm5/HAS7cVx1/b0/EhYufXoq1cbaXEvL15AmoOwK/70tA9+vTdtz1NByVa1zq12UyCyUf0gJZSWztoTAKVh5U6liXeWf6/DJ4w1FaJswK816IGHNfrxRuIVdz7waHny92+sXdN1D5uTm6bavaQJ/gRU5jppa42wdm+pu+BjNR8UFSyyvq9MYSQ4WSJE+IoXYMrobLDEVPZrWabHVAWWd27VGzRYYhBK1AYwtyU</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="MinimumSalary">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6YfQtGKgS3arrDfN8QHr9TCZpzv5sdnQziVaF446sQRzxZqQIAGEmN/8r337bWwEJr6cq7NKFYwd4RACCTmQJWRo8yaqd7t9PKpfLKvqG7KEV65XIX2qUCKw/yTuBC3smJS9KjKQvFYb3j1Ykrx2JDKtXbpUKYa9vMvWJMXbR9PoTwqC8Ouu+ApQqwnxK/QZG86vA8O/hIpCOLJkFrFqAO1Xf9E8nbf8oG3sQQ4gOW0M31c8kLaTmtWAqQZeGbfDg2XwjG/D9xCsjR3L7gCTu5jiyKtlESwE1Ed85ZZP7dLT9Bkt2UK7o6QJGYa2FAKcNai0Rj8E2kygKHq++j76dyEh/otFswdHKyxF5TjBsfz2MCtJf37ea+1aVmgzq8Ajubn9vpz36h9/SkadLxSfNmXJ0jrjRe5VClw9XvmwaGm53TbGVcacLVGxpuVd8U2c7egNby7MtgKOPa8R9emoTjFLjG2mMppa2p8uxyDxUjIvgnwHhRNiynuWhJDymsGdj3tSvsrF3tsGn7KdwjACIHY=</encrypted>]]>
      </text>
    </action>
  </response>

</dir>