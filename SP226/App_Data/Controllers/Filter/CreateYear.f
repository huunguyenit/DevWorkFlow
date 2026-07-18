<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tạo dữ liệu" e="Create Data"></title>
  <fields>
    <field name="nam" allowNulls="false" type="Decimal" dataFormatString="###0">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="cfg_yn" type="Byte" allowNulls="false" clientDefault="1">
      <header v="Tùy chọn" e="Type"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="1">
          <text v="Tạo tệp thứ cấp (ndf) theo kỳ" e="Create secondary data files (ndf)"/>
        </item>
        <item value="0">
          <text v="Không tạo tệp thứ cấp" e="Do not create secondary data files"/>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 200, 130"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="1100--: [cfg_yn].Label, [cfg_yn]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1knDQUw0B7bvwvaApV6TauN5rEPiGSIzhxTReNJ6Gc8vES9fT/jObX0w/QWzbP4afkzdHG4KbZkhZ4qiS1Rb0qrymd6DvtVpYfYfdEz8Yz3</encrypted>]]>
      </text>
    </command>

    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHakZmckG6vNemdxki37IrDsjZwcRjfKeA4+nIVBZVATzrWZ7+zNGG+8P/i5ztk/XPUN0FN6EGTcmSXSf71QOV12sIH3mo8cnUzeYoJWsWmJTUTlVcIsV7qBYHZY45uKMO8BubbiMl9gjIOvwA5S+mQwfHrg15Q2EuYBV83nQ4G9gvZf5HOlgqi1F/4yoLxapHbEFGcKOoGjZKgDyxoSd44pSDuj4/7CilncBM21CEpofR6aRtyC5zemfTACKkILmFVJ7095V5IHg5kKTvnEnV48</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4YQ8kQXaIpSXJvbqwaNJEPdLwQNEfxbg86UL3eVLhk42nrfjua92CyJDN9aJNZFu5aGsIzPWo+QhlkdPQ9pB/4RIKcil963GbAcv34v4Z9i/+0Ch4ogRkEMa5ES+SpPx3P1cUnOAPL5Mi1Hm/J3Lw6GEHiRB2vlnI1MosWptn+AjkLoCmDBo4tTI5QNLUWwiBsXetSmzDU4KZ13hFgTl5sQmijOfLdUd2qdQPmTl7DPzkRyoiVU3cBFduxqHsjgFM5af2Sy6z8mvb2xwqpSu8A=</encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgBMVJqFrIhszV+Z8boXBTifgJFSMm4yWLqEDWv7MEobE4ZjoDheGrTxYd/QVTWXkCwl1uV7ElUzWsdLfscfDrlq9etCP6Rg4LAk4h69mqafiyN7JgB99kMBbFZHl38GTe/oDLiJWcCSu6HIC94ycmhyryTNYyN1rjELMmU4CZ/NwYYOs5e26pH+u6jzH1+L0OWdrAPGY4zM9EDJl1DVPgeeHRxI695quvoqe5w1Sg/Wo8f4ykLyzeedaL/V5zCmo1ot6Ognt5/JHZYiZ0wCYmsdMyfHkuCMyhSd69Jixww4</encrypted>]]>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Kw9xKZUg/hs/uweeYRI1Ut40F7/VmCmb6arrH5TiL0r1svH90RqS/r7aMrwM4bCQqkZqWTqACk2Ik2VnRMuQU0o7ghAvLyTNEOzVpSdNswO1rWzVakYjDts5baDoWTg8M5KR79qsqKcxkxJAvvEfgxvImAFRMdWgo0Si0xdZl8BZ2VEHW+vRAtdpZfLu0nEbo1eMHZZuMpGwMDdvHWyHonZRR0cBOSkAuDgbBdTIA0C7dm0tt4ezzTB/E3rnKRw/XIMBqZROKVai+1cqLJz15k=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>