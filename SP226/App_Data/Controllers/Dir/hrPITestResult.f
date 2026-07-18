<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenBeforeLoad "
if @@view = 0 begin
  if @@action = 'Edit' begin
    if exists(select 1 from hrektr where stt_rec = @stt_rec and stt_rec0 = @stt_rec0 and tag = 1) begin
      select '' as script, case when @@language = 'V' then N'Bản ghi này được chuyển từ phân hệ khác sang, không thể sửa hoặc xóa được.' else N'Can not edit or delete this record, It was inserted automatically.' end as message
      return
    end
  end
end
  ">
]>

<dir table="hrektr" code="stt_rec, stt_rec0" order="stt_rec0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="kết quả kiểm tra" e="Recruitment Test"></title>

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

    <field name="ma_ktr" allowNulls="false">
      <header v="Loại kiểm tra" e="Test Code"></header>
      <items style="AutoComplete" controller="hrRMTest" reference="ten_ktr%l" key="status = '1'" check="1=1" information="ma_ktr$hrdmktr.ten_ktr%l"/>
    </field>
    <field name="ten_ktr%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ktr" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày kiểm tra" e="Test Date"></header>
    </field>
    <field name="diem" type="Decimal" dataFormatString="@markInputFormat" defaultValue="0">
      <header v="Điểm" e="Mark"/>
      <items style="Numeric"></items>
    </field>
    <field name="ma_kq">
      <header v="Kết quả" e="Result"></header>
      <items style="AutoComplete" controller="hrRMResult" reference="ten_kq%l" key="status = '1'" check="1=1" information="ma_kq$hrdmkq.ten_kq%l"/>
    </field>
    <field name="ten_kq%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="trong_so" type="Int32" dataFormatString="### ### ##0">
      <header v="Trọng số (%)" e="Weight (%)"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Description"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 100, 130, 0, 0"/>
      <item value="1110011: [ma_ktr].Label, [ma_ktr], [ten_ktr%l], [stt_rec], [stt_rec0]"/>
      <item value="11: [ngay_ktr].Label, [ngay_ktr]"/>
      <item value="11: [diem].Label, [diem]"/>
      <item value="11100: [ma_kq].Label, [ma_kq], [ten_kq%l]"/>
      <item value="11: [trong_so].Label, [trong_so]"/>
      <item value="11000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHaIgDftHXW2KNrQbmEWvwRUYjcShzMPdXoURd5MEV5qiPNiw1KfkE1VQ/7E62qFZ7Se/95IQFnSYVcLdptcAfoi</encrypted>]]>&CommandWhenBeforeLoad;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1MWjZgEX2gbSUKxmt1/nIMF24XtU19T0z3Z5Wxdi7FfjWOcHWROXh9QTEwrd6uRo9HzEljnLNY5AlEGO3bOgvCxcoFmz5apS0YSQ21UF7d/Gg0u8d3ndLU2b9i1m9bJmhm6delcbA9NZDq07zjtbKA1yJ4BW2ZCus3kcgU2qg8oBQyhRwg7LO3Ixs30QLxNCAccEH1dJ5a062RYzNY/IoFU6u1KqDULlhO7JdwlIHjch9uGvSziYkHjAl/WRVkO0XQMezFjbxlfrRbuZhXbr2bnt5lr2VP+AAv6UAYMr7RBlPAKTB5KTnlcZx1KsG7DLNHR9dWwuIn93JLfC4le0f0=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHZqLQHvIqLTJUpo+DWhlymlb0f7glYOme62xjmIlCmOsw==</encrypted>]]>&CommandWhenBeforeLoad;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5faFui04G3amZ/UcZbrdJfeTy3SmAQWfRU5VMlwmFnfa+CWVvkmnTj3pdtTWHADM6FNJypq2p4wLJDTaAmix5O0+C+8c2k4MO38aekL1K1/BdKcICIKAGfo+tq0QUsrVTEN0LMGoHCOSpK7wXRNcMk=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VMGnAuG6TZuGi7IHA4qURqb5MuiIPUtActJgFUc5FCyRksD1B8RnPfnG/s2pcHb+jFKbHj+HFyBLwhJ0IPUkwtj8EcZCBWGvA+1yP/CApeKSG0ABAGHbfJcbYPbzTcTwVmy4/s+qonCYT1LNXP8FRHaadC6Mv0NgF9qJwemXC0r82Ib0AN8WtekDWOanZpjmX7EGr1m2WHol5W9e9Yfl3jLmuItFV1LKy+RnVuRrhLQiW/C0eJakEBLZPQs60f2z5llQGBlUDAo4cU64w2SQw3Uf2i2OqXqu90WLo7KnYFvz8n4JuZ3sXU/Ix0b517H6HW0dCmU8veA9CWX2RuGRPSFUwkPeQBEVZ/hh+a4qrF5mSQRbG5ZJtsyB11OBsuG01pfz3BgG4kX/F2R7sESPG46Hup0k9dUlTBx0lT9Olx/xTVNOaMO29UsSDJ+Iy8BmPPU5aiNEYyGnvR+/srBJClA+10ypUfiPZmflssAcTBEwwm6xSTmcnP4+cfRLVm/FDd0A42EjLXjCN6K3g8Qd5k=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bUFE7iQS8RHpMpta8FmD9VOcarhU55gfVcHUBf6r57lmC/TIKFGT3p3zQHFTkZX5pvcH7nUFNsVTT7ClETjoF1uCZCRzVMfKk+s4bNOqtW6e3hJIyp8nq7IyMPdFvP57sCWMnC12SaNUO0/H90UrWQhBmvHlpEyJ9InmXiOspW4SS94LtPfyEXEdNz3hMMYwWJurhA1FqNDzGJTKj7ojypCo2esI2SOO56Pv9dYZiaR1whwpTr6ZUJs665FBeKwlTaQwkGYUQ/s7s/d6K0hNe1YPoKKjAgXV+icEwVY0/Tsi2Ts0+JYcLpmGL1gaiARTtY+8zpOfFvPIQY9A/GpEgL+JPEFo6KzUOenUW8QZQpq24z2MED3iWplAjE0Qu49yOPbL4wxSzDeGTgTK3uo5+6AjH9ohjc/bwELXSZMkILPPxa22TZBw9Nn1UK2TKQEYFQOAs8ZrFbCqfWhUK4ogsbYLgngFyzcJrt9XYntcVOz62sp8CPcAtFbQcNYOBSjBB98o6b4wgr1J2+DBZmnk3A=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz6aBk6sDGBDHgaGthtV95WGfW/cJmTUbNUjPXb75Dcg/oG7mNRMmAWaaVi/p28UBA==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bUFE7iQS8RHpMpta8FmD9VOcarhU55gfVcHUBf6r57lmC/TIKFGT3p3zQHFTkZX5pvcH7nUFNsVTT7ClETjoF1NDr49P+3Nu4JwU7P4+QHpCJI/i1T3B556lal9myy0WSbBQgZiao3G9R+zrhs5oNq7iYBdhBPdy4TdtMaRf0MTUrWh01I8jq5IHYOvsbbs0JZJlP7SP0x7zz9IkM62u3AuvwvOWd5Z3v6KLDkIHbk3PW0L8V1adTaKf842rMUn0OaFHjzOFB21MM65UbPpxPbHYrXlVOccv++d8gujbrF+pGdTHcOaLHzm68I7fQtYniN4pkCrQu042EKRHzjOldWjRVS4VdCmhsTYUmOMhxWu</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkberoa6jRl0HozQ9/2em7TRgbBZxVK6WrbqdOuCgmrhBxuF3eRyTeBrlEW2m4lrGyOrQ==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6TCzBJoCtvXgFlIgMAQjy4FgSJeZRGhvliiX2XEbedTXbK37DyaBUxKipTxWvZ1vXOOJtWczJF6z1Vu5LZAORo1QI06lCiZsjmFpm8EjgXyWCiQy1lgA9dmWTgXo+WsUnww2yu2Z3h//KBAZU148/I</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70HvpUi93yTVJdgr6eNhnWcOd53p2jwLYSdAlCxrJBiGTwVLsJeyWXREt8vsU4ZvxH1+ZMHUSNteE8Nu07PoHLbkcxtohaBrx5oDu3ed5RBVPk1iGiLy83bOcNudxiG3cvJtuz64nn9Z2nalQ/coC2OJ0Pb806+mPzyVKK8WBV0K7dsIC0Tu6W7bI0jZDqSPvvQ==</encrypted>]]>
    </text>
  </script>
</dir>
