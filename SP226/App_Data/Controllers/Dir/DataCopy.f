<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Key "declare @rk varchar(16)
select @rk = rkey from @@sysDatabaseName..userinfo2 where id = @@userID">

  <!ENTITY % TransferData SYSTEM "..\Include\TransferData.ent">
  %TransferData;
  <!ENTITY % CompactMode SYSTEM "..\Include\CompactMode.ent">
  %CompactMode;

  <!ENTITY VoucherCodeNotUse "'BPT', 'BPC', 'T04', 'PD5'">
  <!ENTITY VoucherCodeUse "'CC1', 'CC2', 'TS1', 'PC0', 'PC9', 'PT0', 'PT9', 'HD0', 'PN0', 'T02', 'T03', 'PT8', 'PC8'">

  <!ENTITY CheckStatusBeforeEdit "
if &TransferType; = 2 and @@action = 'New' begin
    select '' as script, '$NotAuthorized' as message
    return
end else begin
  if @@view = 0 begin
    if @@action = 'Edit' begin
      if not exists(select 1 from @@table where id = @id and status in ('0', '1') and user_id0 = @@userID) begin
        select '' as script, '$NotAuthorized' as message
        return
      end
    end
  end
end
">
]>

<dir table="dmscsl" code="id" order="id" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo sao chép số liệu" e="Item"></title>
  <fields>
    <field name="id" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="loai" clientDefault="1">
      <header v="Loại" e="Type"></header>
      <items style="DropDownList" >
        <item value="1">
          <text v="Chứng từ" e="Voucher"/>
        </item>
        <item value="2">
          <text v="Danh mục" e="List"/>
        </item>
        <item value="3">
          <text v="Số dư, lũy kế" e="Opening, Accumulation"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;<![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZchHGBagL0PtKGRnCo+W651TUNBGDcoPGpvFC1Z7mWuu39Z20QfLwhbCZAIdModGJg==</encrypted>]]></clientScript>
    </field>
    <field name="ngay_tao0" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày tạo từ" e="Created Date from"></header>
      <footer v="Ngày tạo từ/đến" e="Created Date from/to"></footer>
    </field>
    <field name="ngay_tao2" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày tạo đến" e="Created Date to"></header>
    </field>
    <field name="ngay_sua0" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày sửa từ" e="Modified Date from"></header>
      <footer v="Ngày sửa từ/đến" e="Modified Date from/to"></footer>
    </field>
    <field name="ngay_sua2" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày sửa đến" e="Modified Date to"></header>
    </field>
    <field name="ngay_ct0" allowNulls="false" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày chứng từ từ" e="Voucher Date from"></header>
      <footer v="Ngày chứng từ từ/đến" e="Voucher Date from/to"></footer>
    </field>
    <field name="ngay_ct2" allowNulls="false" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày chứng từ đến" e="Voucher Date to"></header>
    </field>
    <field name="delete_yn" type="Boolean" defaultValue="cast(0 as bit)">
      <header v="Xóa chứng từ trước khi sao chép số liệu" e="Delete Target Data"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZecBEWrLVh3Ye6ICXEGDaEZ3ObqQ8cxpfm74t8cqxr/ioa6NBveCmuMMq9QkWb5qMg==</encrypted>]]></clientScript>
    </field>
    <field name="ngay_xoa0" allowNulls="false" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày xóa từ" e="Delete Date from"></header>
      <footer v="Ngày xóa từ/đến" e="Delete Date from/to"></footer>
    </field>
    <field name="ngay_xoa2" allowNulls="false" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày xóa đến" e="Delete Date to"></header>
    </field>
    <field name="dir_list">
      <header v="Danh sách danh mục" e="Dir List"></header>
      <items style="Lookup" controller="DirList" key="status = '1'&Operation.And;&FieldsFilter;" check="status = '1'&Operation.And;&FieldsFilter;"/>
    </field>
    <field name="ma_ct">
      <header v="Danh sách chứng từ" e="Voucher List"></header>
      <items style="Lookup" controller="Voucher" key="((voucher_yn = '1' and dbo.ff_ExactInlist(ma_ct, '') = 0 and ma_ct not in (&VoucherCodeNotUse;) and ma_phan_he not in ('TX', 'HR')) or (ma_ct in (&VoucherCodeUse;))) and wedition &lt;&gt; '9' and status = '1'" check="((voucher_yn = '1' and dbo.ff_ExactInlist(ma_ct, '') = 0 and ma_ct not in (&VoucherCodeNotUse;) and ma_phan_he not in ('TX', 'HR')) or (ma_ct in (&VoucherCodeUse;))) and wedition &lt;&gt; '9'"/>
    </field>
    <field name="ma_dvcs">
      <header v="Danh sách đơn vị" e="Unit List" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="overwrite_yn" type="Boolean" defaultValue="cast(0 as bit)">
      <header v="Chép đè" e="Overwrite"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="0" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="0 - Chưa xử lý, 1 - Đặt lịch" e="0 - No Action, 1 - Schedule"></footer>
      <items style="Mask"/>
    </field>
    <field name="status_name%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="kieu_chuyen" inactivate="true">
      <header v="" e="" ></header>
    </field>

    <field name="cpass" external="true" defaultValue="''">
      <header v="Xác nhận mật khẩu" e="Confirm Password"></header>
      <clientScript><![CDATA[<encrypted>%/SjCqBsXcIoqRaqcL3p1ts36golF8ur4r4Qnq6lRtP5I+LMRVVTCDYR0bnCpItFqWuqxrcCE50IrrGzdMoOWqQ==</encrypted>]]></clientScript>
    </field>
    <field name="chkpass" type="Int32" external="true" hidden="true" readOnly="true" defaultValue="0" allowContain="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="64">
      <item value="120, 25, 5, 70, 100, 100, 130, 0"/>
      <item value="11000--1: [loai].Label, [loai], [id]"/>
      <item value="11001: [ngay_tao0].Description, [ngay_tao0], [ngay_tao2]"/>
      <item value="11001: [ngay_sua0].Description, [ngay_sua0], [ngay_sua2]"/>
      <item value="11001: [ngay_ct0].Description, [ngay_ct0], [ngay_ct2]"/>
      <item value="-110000: [delete_yn], [delete_yn].Label"/>
      <item value="11001: [ngay_xoa0].Description, [ngay_xoa0], [ngay_xoa2]"/>
      <item value="11000--1: [cpass].Label, [cpass], [chkpass]"/>
      <item value="1100000: [dir_list].Label, [dir_list]"/>
      <item value="1100000: [ma_ct].Label, [ma_ct]"/>
      <item value="1100000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="-110000111: [overwrite_yn], [overwrite_yn].Label, [status], [status_name%l], [kieu_chuyen]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TQaIDYYphlR6WJ/9IJvGYy9GcdbM1BzW9DGoDbWBv4/okwBDgr4i/Sy84MbY/kYZVGW1rM5lQCooMGrNJZAAUFosdwmEetQ65L/B3rV7E55KQbOSaFYpWI9eNP3vk/7sHl/BKWxGpL7S7TtdcWIp3RlbIHzfjISmmBTG1qec13WMoUDfyJhIttuLxIv8AbM3mMmCETr5Sh7yK5Dztfk5LADJIrvrmvyE9Se3NVC8LxzGAwjfUpoRvImU2uWOZedAKwRJFiQJ/MThhn/SDZddjQ=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        &CheckStatusBeforeEdit;
        &Key;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2Cb9DEg9VFeHZcrozoMSzfFD/WNKZN8bu6KUHfZEi7FYf0jkP4NKEvaO8I70UDXEqB5PHxcQhUkwOEm1awWR6lZoScCpFyQrzuRwNhwf1KG68+f0EJ8Tkas1La/gU6PHQ==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxofxlfzvPc09UahCXkyZPCxTn9mpzF/MNKKBfo2g+RlPkFRoOADIkeIfDglTDVQjEeKG5DJrlebxtE/E05puDQ=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CheckStatusBeforeEdit;
        &Key;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2Cb9DEg9VFeHZcrozoMSzfFD/WNKZN8bu6KUHfZEi7FYf0jkP4NKEvaO8I70UDXEqB5PHxcQhUkwOEm1awWR6lZoScCpFyQrzuRwNhwf1KG68+f0EJ8Tkas1La/gU6PHQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+iXBNDcLxTscyAo2m2Vy7H/bNyY+cqB0pWOxSzM8EIa3xaPNs2gueooNfuQqwlYjQn1LCmXWi8x+c0WdgIOK5c59w6K9YdgktySFbubf+zzsW7rSAC874K+b0audroRzmIS1ThKurqlpF+zwSKCehzPgpbKYAfzXrsugFr4IkYVB7Q0RHmdFt68NM/vxu5yLkPjRppnPyuw8a2S6NrOjedXHpZsKHdThJ2WFFywHuBU+Bo9oUh5ZU4dP0rnHfKbBkCk3BKg0Va+hjDA4u9UULlXufvZ3zAoZJ1bwtPAdgM01VwbhytqmYG0/K90Adnnbn3afSgpyZVPhRmSqZ9qnCJ9WLKwG4Tg5qFaq4sTk4IPFwEnqdHbX2GhljIgRvTF6zkI1lHw7btR0ostGi0QelC/GORoJCGqPhbT5BF983Df</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ohIvD68n3Gx0UTrDPMIU4hrmR+PvQiVHyH7SGjnN2BljxRXDkt8w+UgbckqqzrNiokjK4+w66qf9QCeH6YG9PZ9</encrypted>]]>&DatabaseSource;<![CDATA[<encrypted>%yLooQnL9xQeLYF/0lD7Rzjvt8oLtKlPhyM2RjN+unPoJ55/LrlMII7SSFMbIXnx6lZvae4SIBxQsJV+I3ohsdtVvnfTabPxCWknHrQNcibjVzjxzwjn/1fhww3ttwePAcjwkMb7zt9cVVhYM5Fpmqw==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+iXBNDcLxTscyAo2m2Vy7H/bNyY+cqB0pWOxSzM8EIa3xaPNs2gueooNfuQqwlYjQn1LCmXWi8x+c0WdgIOK5c59w6K9YdgktySFbubf+zzsW7rSAC874K+b0audroRzmIS1ThKurqlpF+zwSKCehzPgpbKYAfzXrsugFr4IkYVB7Q0RHmdFt68NM/vxu5yLkPjRppnPyuw8a2S6NrOjedXHpZsKHdThJ2WFFywHuBU+Bo9oUh5ZU4dP0rnHfKbBjiphHK2vUvmi8jlvLFlycDldO5pRGsuYyrJfhXypirW</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeqh6Uc4IjkFjc3zfr7e9N2iiif+5rG1XYzVAMdEkeB0z</encrypted>]]>&DatabaseSource;<![CDATA[<encrypted>%yLooQnL9xQeLYF/0lD7Rzjvt8oLtKlPhyM2RjN+unPoJ55/LrlMII7SSFMbIXnx6M7b4yzU1jBUViEKHDdbes16wD8qthYR1czRlWItsvmo=</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBqdxKyVHbMFGSgctjyato7AYDV5tCErKe4StPzzBvQHaLj8jGlwldE2bGR+TKRbni4G8Te98f/TQ3RNUqKHpkTlXovtFbxPXqnxwjBbcThzJBVnYSQrvTn52L0zcOQOIyDD76PUSmSztqLwcTc2/u5xQjhPqNhpchGGkAJAa0CT2g==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70LBBxTxVo2wdYrIJzAd/YcC9NbpJekWxiFVMLD+8Fr07nFszkcwGYKuWzRxNf4rFsvqAWAt5jnLuoEGutRlFEFMH76XvsGWXLHN8PkEX3zRoinXkzU0eIlyUEyea+6O2w2X1WX8+XTweTiB/JSsQW1xgEhjCOgH69j3dfeeT9npj</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70BErLjedFa9UoCWr3eZu8/G2Ua4JnrFjq4eiIXYfsOUj6/qGXDpC2l13npMSsKF4Cd4ymKKQlWSfQmCs1d/mJb60akOgBV5aneq24KOHyHIZ2BOQDXkQ8f3ssv4nqoQMHALuP4o1hbvnhU1+85+CSGQXocLvn2ePFh8XRaUsR+n56bdcqubJf2eecYsApWyPfP8RBvnmDpjO26KxHQQYNemzhh1wsn/DIVRKiaelD3gIU69R/TL7uSS1b+D5lZfmrpCYN4ghiHNRMOx25svICAeV8cBMz/Fwa7NgQlze4JZ+</encrypted>]]>&TransferType;<![CDATA[<encrypted>%hDUWR9l6BhKJdXRAkiZ5AfzFFCbXlNMr/u/kJBTl0/64BmTa4XpvM2tm/2YhZSwdDjy4T9X6T/NNebfSb4hzjDs1cF+Rtv8NaR7y66xeSLo2UJnDFchwi0529To9fCwIq168SjX/ZeaHoIpNr+L2c+YTqA0MSfiwV3OC5MyrEWZnFQAQ/psehNrpkONNJPCp98o3BNntztcE0AxSg85Lrk+o3xBI680hcqxNmqEXVgue5S2in8Ut3Ih+k9OKJpIlHnDmjShLBcNQgjB/fBSs8+A43ziJy//HVfHIDGwCEj4H//tBpk9bBjRP4L6RTn6W7bUrDdraM9Y5LuqIsfI63fVL96a92MDgNB3pRc6av5sSRKwiZZ6+j94lvEMQGcq8SDVyXrZ2sl94zmuU5+2rLudDd3xnSHQvAw7DjZ73qVeryNkI46D5z0iwgXpP46OPjxBEMFDp5txfw1n/vefbFtSsL13LxtjcbSPtsrLzSP3x+1VRFnfcMrJ3z/Igz6VKKl/J3hbGgkb65rV4riCvbXAdDvEO6MxkM+PPk5xzcxtNH2WFIaEJ8mJ9CtOYCXIwH+spABqNSq+euMNpvFBcLAJS5FEHhpZAlg0/FHz845Ax3e2Rql+jGWciQ6iCPcvF8vB4j2+PEsdjzet3r8XJyUt5MacAiHvuor5yAdtg7eymci133amZox6E4KX1Z/sUvzXb2821fp56ugTWGnhsG8HpDjwJAc9SAB5HNX5XuIEhlVr/b/l+YIL3RV/F27xVi2oZI0eQGHZTGNfI42TTd0hO6B5WFa3/FW358Wqdk7dsM1Dfn+O6fhFgy7Q7WtTS06fHPeZ+pa0qIw9tqNH/DQWxbwdjKC5CgiqDX/MHJEBxG+QTpW3pxBfr5faA28aWEhNmKofCF2gRJD+dF6WvAfU010kTf7ak8MVpjwm39JYgEg2DObtpd0LUZDOPRs6j8Kt5fKjyn4tVD4rPg96qUViglNiSxGie3WMdRSsXRPnPaem+NvnK/X1IbVJ1AnxEwqn7ephN2YaoUTSakYwFeG6FB3bKvU8FRPGKC8rabq98cYq2o/E4WflUB8LjwgNDSLjPPMmdSL5hMTbPai8ny65zS7O9FTPHXnAu7lQYv9r6hkfHjXz5p0Jt+FBcOh6bkdfGrbdRqUBY/4obBKbBfW3/usaMTm7g0kfGenH56OrmOtlLgwTNAYymzWrCBZ9wPGcljhrZtYxFkMMWqmhdk+vZHjW31NJgjkGtn6Q7m5wExK8FVBDvB9oygQIEtzEw6d3B/ThGym0I1BclquuWoqbAKXeF0ukp5nSadaX3FgO4FixaEEtySXlwEA3JSEmPcc4p7vnCTZdufgoCYUwYEtxgRZaULVfAoAm6diS19BfMmJGW1oJYGZOB+as2xGKEJUip1RiVrWq3k/UmO7oVBU4r2tM1WymJXMoixIDxrqk9UJBZwZXf4we/gKdIuZH/yVoUn1tZUNO4DAO8RK9yBTeuiYsYzbaEM6UA38Rh63R3zWz50inCvHvPdl1dYr2XX8wdKwaeBZ3cXYmAIf1gC7DPLW7P8qTOofjpVLWHthEwA8LvJ+EUcpUU932Dy2oz</encrypted>]]>
    </text>
  </script>
  &OutlineCss;
</dir>
