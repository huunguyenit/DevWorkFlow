<?xml version="1.0" encoding="utf-8"?>

<dir table="hrdgth" code="stt_rec" order="stt_rec" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="cập nhật đánh giá thực hiện công việc" e="Performance Appraisal Information"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" allowNulls="false">
      <header v="" e=""></header>
    </field>
    <field name="ngay_dg" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" defaultValue="newDate()" aliasName="date">
      <header v="Ngày đánh giá" e="Date of Appraisal"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZaYtRkcmC5pnxQixXY0ew5Y7M+7CMAaIxL1nKAJE2p83ULAo89bPF+r+zQUrK/4g8JEnEhgBXJKRPb4/0RfL/fc=</encrypted>]]></clientScript>
    </field>
    <field name="ma_nv" defaultValue="''" external="true" allowNulls="false" onDemand="true" allowContain="true">
      <header v="Nhân viên" e="Appraisee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten2" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZaYtRkcmC5pnxQixXY0ew5Y7M+7CMAaIxL1nKAJE2p83ULAo89bPF+r+zQUrK/4g8JEnEhgBXJKRPb4/0RfL/fc=</encrypted>]]></clientScript>
    </field>
    <field name="ten2" readOnly="true" external="true" defaultValue="''" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_bp%l" external="true" defaultValue="''" inactivate="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ten_vtr%l" external="true" defaultValue="''" inactivate="true">
      <header v="Vị trí" e="Position"></header>
    </field>
    <field name="bac_quan_ly" external="true" defaultValue="''" inactivate="true">
      <header v="Bậc quản lý" e="Job Grade"></header>
    </field>
    <field name="ma_nv_dg" external="true" defaultValue="''" allowNulls="false" onDemand="true">
      <header v="Người đánh giá" e="Appraiser"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZaYtRkcmC5pnxQixXY0ew5Yl3PL9A3Oi5LOlae88KtEPQ4YiH3tOD7YU0QRi7HhCM1pVdxGEh/Yh4hfjHcWzJ0U=</encrypted>]]></clientScript>
    </field>
    <field name="ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_ky" type="Decimal" allowNulls="false" dataFormatString="#0">
      <header v="Kỳ đánh giá" e="Appraisal Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" allowNulls="false" dataFormatString="###0">
      <label v="Năm đánh giá" e="Year of Appraisal" />
      <items style="Numeric"></items>
    </field>
    <field name="ngay_vao_cty" type="DateTime" dataFormatString="@datetimeFormat" defaultValue="null" external="true" inactivate="true">
      <header v="Ngày vào công ty" e="Join Date"></header>
    </field>
    <field name="nam_lv" type="Decimal" dataFormatString="### ##0.00" defaultValue="0" external="true" inactivate="true">
      <header v="Số năm làm việc" e="Years of Service" />
      <items style="Numeric"></items>
    </field>
    <field name="nam_cv" type="Decimal" dataFormatString="### ##0.00" defaultValue="0" external="true" inactivate="true">
      <header v="Số năm giữ chức vụ" e="Years of Cur. Position" />
      <items style="Numeric"></items>
    </field>

    <field name="status" inactivate="true" clientDefault="1">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập kế hoạch" e="0. Planned"/>
        </item>
        <item value="1">
          <text v="1. Tự đánh giá" e="1. Self-appraisal"/>
        </item>
        <item value="2">
          <text v="2. Quản lý đánh giá" e="2. Manager Appraisal"/>
        </item>
        <item value="3">
          <text v="3. Hoàn thành" e="3. Completed"/>
        </item>
      </items>
    </field>

    <field name="d01" external="true" clientDefault="0" defaultValue="0" rows="192" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chỉ tiêu" e="Criterion"></label>
      <items style="Grid" controller="hrAMPerformanceInforDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="yk_nv" categoryIndex="2">
      <header v="Tự đánh giá" e="Self-appraisal"></header>
    </field>
    <field name="yk_nv2" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="yk_nv3" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="yk_nv4" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="yk_nv5" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="yk_ql_tt" categoryIndex="3">
      <header v="Nhận xét" e="Comment"></header>
    </field>
    <field name="yk_ql_tt2" categoryIndex="3">
      <header v="" e=""></header>
    </field>
    <field name="yk_ql_tt3" categoryIndex="3">
      <header v="" e=""></header>
    </field>
    <field name="yk_ql_tt4" categoryIndex="3">
      <header v="" e=""></header>
    </field>
    <field name="yk_ql_tt5" categoryIndex="3">
      <header v="" e=""></header>
    </field>
    <field name="yk_ql_cc" categoryIndex="4">
      <header v="Nhận xét" e="Comment"></header>
    </field>
    <field name="yk_ql_cc2" categoryIndex="4">
      <header v="" e=""></header>
    </field>
    <field name="yk_ql_cc3" categoryIndex="4">
      <header v="" e=""></header>
    </field>
    <field name="yk_ql_cc4" categoryIndex="4">
      <header v="" e=""></header>
    </field>
    <field name="yk_ql_cc5" categoryIndex="4">
      <header v="" e=""></header>
    </field>

    <field name="t_diem_nv_dg" type="Decimal" dataFormatString="@markInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng điểm" e="Total Score"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_diem_ql_dg" type="Decimal" dataFormatString="@markInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="stt_rec_nv" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_ndg" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_nv_old" readOnly="true" external="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ky_old" type="Decimal" readOnly="true" external="true" defaultValue="0" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="nam_old" type="Decimal" readOnly="true" external="true" defaultValue="0" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="252" anchor="4" split="7">
      <item value="100, 40, 60, 100, 137, 100, 8, 58, 50, 100"/>
      <item value="110100-1011: [ma_nv].Label, [ma_nv], [ten2], [ma_ky].Label, [ma_ky], [stt_rec]"/>
      <item value="110000-1011: [ten_bp%l].Label, [ten_bp%l], [nam].Label, [nam], [stt_rec_nv]"/>
      <item value="110000-1011: [ten_vtr%l].Label, [ten_vtr%l], [ngay_dg].Label, [ngay_dg], [stt_rec_ndg]"/>
      <item value="110000-1011: [bac_quan_ly].Label, [bac_quan_ly], [nam_lv].Label, [nam_lv], [stt_rec_nv_old]"/>
      <item value="110----1011: [ngay_vao_cty].Label, [ngay_vao_cty], [nam_cv].Label, [nam_cv], [ma_ky_old]"/>
      <item value="110100-1101: [ma_nv_dg].Label, [ma_nv_dg], [ten], [status].Label, [status], [nam_old]"/>

      <item value="1: [d01]"/>

      <item value="11000: [yk_nv].Label, [yk_nv]"/>
      <item value="-1000: [yk_nv2]"/>
      <item value="-1000: [yk_nv3]"/>
      <item value="-1000: [yk_nv4]"/>
      <item value="-1000: [yk_nv5]"/>

      <item value="11000: [yk_ql_tt].Label, [yk_ql_tt]"/>
      <item value="-1000: [yk_ql_tt2]"/>
      <item value="-1000: [yk_ql_tt3]"/>
      <item value="-1000: [yk_ql_tt4]"/>
      <item value="-1000: [yk_ql_tt5]"/>

      <item value="11000: [yk_ql_cc].Label, [yk_ql_cc]"/>
      <item value="-1000: [yk_ql_cc2]"/>
      <item value="-1000: [yk_ql_cc3]"/>
      <item value="-1000: [yk_ql_cc4]"/>
      <item value="-1000: [yk_ql_cc5]"/>

      <item value="----101-11: [t_diem_nv_dg].Label, [t_diem_nv_dg], [t_diem_ql_dg], [cookie]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chỉ tiêu" e="Criterion"/>
        </category>
        <category index="2" columns="100, 100, 100, 137, 100, 8, 100, 8, 100" anchor="2">
          <header v="Ý kiến nhân viên" e="Appraisee's Opinion"/>
        </category>
        <category index="3" columns="100, 100, 100, 137, 100, 8, 100, 8, 100" anchor="2">
          <header v="Ý kiến quản lý trực tiếp" e="Direct Manager's Comment"/>
        </category>
        <category index="4" columns="100, 100, 100, 137, 100, 8, 100, 8, 100" anchor="2">
          <header v="Ý kiến quản lý cấp cao" e="Senior Manager's Comment"/>
        </category>
        <category index="-1" columns="100, 100, 100, 117, 120, 8, 100, 8, 100, 0" anchor="2">
          <header v="" e=""/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4FXW/nP2fLLcXw4nbA2vpM9VLzlAG27YKCKI7EIZEljESDubR4wZjPyOnY0HHnZrnzg56BKXoLENoNlG1e/jvxoJIAPGzAP1Y541E+EOocs</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwHG/pS7Bs27X3LbRl91M0gy/ijP04h4qPP+/c7ySBVmQQJKM4ce647r+SZxljz1opAk7EOhDRR3NFfE3dNGZJjOu3dMLYT2RULnvckzrIoJ</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzGkms8TajFmA7a4px+B/PXF5ACE6sJIpwnqnviN/lvbNkOfjZbZVPdx36DgJegcqSZo8jJCToSC6w9VqaYFkLTXA66Dr/yKLfsf14eDEjti9q37wZlCfE/fN1A2oCZHamh9r3VlpNVffn9rxfmArqc8teLrppaolTfS1iHVF6nE3u4PDaf8LL915bu97CnLcW2uAN5chiA1/kBrUQ2UnndTjPXbTwBH5hA/iM7YzKGrhHSxstvmtqRWnfVxq/XChDYIy/Eae4svog9VCYNb58GesXHeS3se3Jb4ELw555uiq/xr2GHTQJLst3jlNlUrKALtMYX6neFJX02FL48vG7Ey2jALT68nFB2GOMth+0a3fRcMLT+LcvbHUPKJtrqkF4l31aU3ei2E4ddMtZ+1hJCXyD6W5f6DnKFgmGekYzUWo/lh5ai4mHZ6JOh4NDZ3aTYcfcnD+gntlWaOjMs6qJARH4IqCQuIpPokhWtyHh36sCSqZmLRFDCoYlPpLVlEj8eQ8ysq83tE/VFFR8sWs6SCHTMvL3/jnEigycJZ0zQo+BV1oCE+MLb7RvclahkVQweaRmkfKZim0MaWMLYl0N6XhjvpvAPBdJh2cN/pGNFk1aFS8xiw1Pk5O1sGrOnvV91HhpRpTEOUdJwS0VjinZoErr9k7lYt+OXzggLZNP4utAyA0UikC33zpyDaw6eU5KfC+GXP5hyqXsWd+FdrG0QcRJePobyQ0DVbxARy+ZGQCSH8Zq0ek/BP/rQXtcqnoZ0nV9TuQ2I7olcZknXdPHV3amSxPdoXxeNN9bKQmTAgjoQYotp8o9IV6VRObqOYjg==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WaN8MSyJECa5wYt3cvTqaI3o19g8fPOwpopiurqc5Cft7C6fCiXLen3hKilUTXLuRGfi+yObrosWDTUUYCWxoLIGX3ZPe2olv1UsAF+Z5gljZgK6401jY0j33bF7yExHWbermyO3UXdvZkAP34LKJZL0P5vZmDfeCbW1ISWQb/WduBFCiqrTXRDfb+3phz/l0teay1cIPaZBJZ2NFLT8gyOmYLP29j8LOMWc2LRBgjdXFwzr9NevNBD0u7phqTWL5Yfam69s0zo2v0Z4vavH8QDJsPMUXxjlrrRuZyLgXYfpiTiT5qrlor1U8dPcGhhEJcKy5J2s96wdG5n5p3g0pgNuaBWrrdwGB8LXkAZdSyjgp0rP8g0hLalXhxrHNO0RKVrKs63k1X5PqC9Cs9GMheaL2Qx/fzDFgUJX8p1P5Aew8rgtxQN4bLFjsEeDv3qVZ7j50dtTTZv5RU6VTLwvgR8rLLdAvpEe58kXTccXljgqKbCPP0LFUmD67tuNIpGQeGyOFzF1SYQR2rkfmfCgUS33fdKwuZR02dpPxrLaMaLqhFkciHKHrkUndqyxQEiVDTodxz6xyHnwsTxj76bfFQxym0ld9mEdXmFSY2W3rCCQbZCqDA+snZy661ZUuOXySzB4NHuFa0QCQvlTH5Ch6XpenQ9YKxDzlZ7p9+syej/c=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBpaVAFu5QyySNCId8TxGMX+AFvdDfQg+U0AaDtiElkkG8XtzfUQH/gO83ykkT2f/025Wr3JvoGi6yZ/wa2wNw93QkSqIwmMJD8cGjkdiGp4ukj0ph54p6omAYPcHMwylxG2RKCYK8qmcdpxqJl+WIvZVOJq8nh0hPal6ZIwLy6SebI4D2Bq+oQFuBZdTMONIR//2FzmCb72tMqfVo+xQ0f2b2tQJLAJ7iT9uTaAji+G8k+pjLm5HeYkhTC6wZjTKgs8jg82U0lGuJfGx/a22ymMVTXu6mGEOzmcHd5V7HyOHZzVrdxGKxowg5uXVRrLrHce90C58uTQL85ItpH3mkV+wbSmxH8yf5u77rArLUMa+R6ftwi7BSoAFUJ4wbZd3XjIxfgMUpaMCBJ/4cDzD8nCQVAplcKWfJMx27W7nvrow77Hid1wzW9z4nUEmTOtSQQZtvQoZT6B0fmKIn0cjKtZGs36TDbBtoskhQsO8zz2k2n4sAVpHWWUP6oe1gjxoNdChGaY6uknnJ9KZEDnbDsjw+xv1Uxr4y+JaEfyu9m0CCsTO938DwWGpEzdrR7Q010=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+HjbwA7bvsI5hpU8T71EglRY5Im52/M4HHIXbUe5OmCGlTtMqNDgUySJfCX4XKeESsMLl6GfKzcSXWtqw22DPM=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBpaVAFu5QyySNCId8TxGMX+AFvdDfQg+U0AaDtiElkkG8XtzfUQH/gO83ykkT2f/025Wr3JvoGi6yZ/wa2wNw93QkSqIwmMJD8cGjkdiGp4umvyaal301hEmBeT1lblT0rz69R7zSVX4mq748BKyuKqfrHT4347t9PuJMkgOwJZK5OpJV7yrKLLeLQQ2OENPGrWW/1Th2Td/QjbNWyU1WE8tYos08+sSKsKsRcoQcU9JOeocVqlKkRyPS8V0cZG3klotc0qoGCsZUavuyIaejM3qb0BEmvL8bVp5MtkGVmda1gElfcpcAU2xC5E7RQXmfMq3pmYP4RspFBTNoRPinL8BbtwwU36GbQwJwIXeKtRF9Yynt4Foo+YXG9nUx4Cna32cZmAVNePvRIYceL+mRFm</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxhSSgHrn0dvIpj2iR6+RIOmkp9KuJGYGlvuV04kFrcAG8bPkFGCKFrHaEKd9DNOts98HKT0GFjXbOhaxzd0hSJYeVFHRvLXPlMB8IIqy3swmx4VtK0KRBRNMC7fg0iwhytF3y3P6uaIZrmVIWxkHWu0/D3EnfsL2Tl50VsM9BtxuSEbPlKnKHiK34EtGIwJ86TknENPTnyjZTEN6Ox3Iq8=</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ZkRUHNagf01oIuFvkdLWdWFElLlxqFXb5jR1fBLCSLv+lvl0e26w6U0AQ4B2MF3HA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70BFZT546407bfL/+wyVPzy2O9lSvP7Ja7XYq5RWsXK/eMpZTeyxqxM8MXE4LR7eO+LdIgqo4+OtT0R2HXJ5Z8tHiHgofRqVRwA9HXimKs6bdRNRtAviddTwqKOpy3iFMOw3OKhHpS/+xVRCy9YisybLRtlIIpDJuW5xb7PKgFO/ZU6xabmiBkEMQi9zAPW+5Ateqlbfs9G1S0nTr5mrROHTcx0pc0r/mw/AdH1GZ1XOtQifOW1eZZ3474ots0padhDydTWSYHO5ixyO2gWHsYxUDiYvOLykDdBfPIQf1bUvoegWqIM5fbabta8OUjD622iDEw1NoXT0EX5ddk3FARzXCg6kIuyNEUBOcXjEm/wKqiVKM6jaB+MbojPpixSULG2BdxwdTiYs3+ApxwZYQFUr+eMuGqIY/ZxGnwj6N1ktDcvBg6TBjAumy3DqW+lO2Zra+NDKDvMmlYA8tJyzWYKmohJx+IgwuJ8eDHiCPuKGYAfk8lzAqb/JL+nvuobdouBCpq3IEwquYgZhw0XAwjKXKaqBLaTEUflQn7x0BpNQOGPocDCezg2Lgyv2ZcP1NEfbYpHjWUDwJ97qTatca4ZJWkEhC8UZ8ujqQTSIcE7VGakEXIieASk7dzLuWFf9bPAcnwNlL20xztCJ/gCxSZ5wPsh9ircd53cukM2nAHdfMkmracle2zmD3DMbhIeV8aCgiZKhCAMunxNV18GE8AtA188VWlEc/BHYZVNHa48dsYvGafb+EhMd0VqQH+kBR6BPphJqcrbbEDXJ8hWJflVwX7W663s7anPFaia2MChTaZKT+fVxHuxt3IMzYo270cNI/J5bmgHvMgXSwt2Cig6A4UZVCGXFehpqADLzNxr8isfeaAxFzrcGS2eA3LdOup+4HO5YB1foTeswWadyZfbkd03e3JHZ6l9HuYBTRechhBwHXUeY5tBEmbyukIOpmVluarWSEwQRm4o5XZqwk5Cqbc3yrKO4nr0E1pHRU8lSucgFYCLOKWkKnDTq4JqfihMva1ndUypTRPuQ9Ee/3E/BqGSXkNscJKXPDgFZG/WNwGS0igAam70daergbQ7LhvCYYbX7N8mhrNu9bhjudXdlEcbwyf2r61ZVRsK5XsgTBTLSSq7kRJQEesJSmGWwAiggOzKZzDCSeuPXlCI1lbljOm/76G0O44Ia5U2wYFsIHy/avukcSRWzGvmYl8l7gsmT+Mh37G8wC2qpUq0IjObY=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Appraisee">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6Wdyk9aPi/fGimY6rlT0N8nVAGzan76LcTwu5Z5TgGNf3AdQkao7SMsCtNs0+RPUxnBTv/7Cq64EPNLwRmdQAXKNAjftWi7EPbqRu7DVn5kK8R1pMW9/dfiIPhpYxIHW2+wybHqgB+dXRgkImICqMx4e2ajtH8RSosXGLQKLb4qD3ynd16B89I80zx4a0p9f1AcZx2wUTvZ2t6AiUFq6omuYuMbH38t5jIxkN3EjGZQ017/Ego0knlYo4LoVva9x1AzL18MsxSreaoWJn99503jZfbOFfNJ93l6MSyGd/JeNvllAw0/zqqBprSW0v6uCcKQ21EF3+XGQX8LTn2vZpuTIuJVhHY91jDkXC+g39ugjrLppJeAA5P9pY0ZIn9Th0MtCRp/vScB3YNPc3jeS9dLWdxMpsodB7OPzEXxvvt4K5oWMOYr6cKeXbJehlgXGZvpUleMGxa7E4bmX9vLuF56pPoWjvMJJEGx/mcjDxjO99Wsh0ZuUP7w5/LS8NX72MEjYro4+GTLUwgiiDuZqwUcpBHR6gvxlSlsQsmQbpW1jwTBzFyRSA7sA4CZGJVhLHRt6oIzKKh3W9w/jXOfbn3iFkUvPU1b1LFbHiY9KhxBqelThOPpre807RqmHsWxOcBGX7fdHAS4Ry6XuTYANemdvdoUhgSfeNjduYZsehBFxcPqkLVEGleK8VH+2IrsQZwtuF1ncoG9UZGqDmgwn7JFYPXBY7G5VkTVoEibiW56khbWFgmLNsiGiH66IQlFoi2z0I0E54VtGsd1f/KZS35TYbATQiZ/0n4l8GaDBvdFT5CFRVjXJBWGuFGGakRl6s=</encrypted>]]>
      </text>
    </action>

    <action id="Appraiser">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6Wdyk9aPi/fGimY6rlT0N834CG83zUb9SXy8KMWrDvIjrsRRBMWz++/aFbFNstpgOdcKRIyYTRvva7ZAlIezdGBmiulOODGDey1ZQEzF/5oA==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>