<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir table="syseventsoptions" code="id" order="id" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tùy chỉnh" e="Options"></title>
  <fields>
    <field name="user_id" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="number_of_date_before" type="Decimal" dataFormatString="##0" clientDefault="30">
      <header v="Số ngày hiển thị" e="Number of Date"></header>
      <footer v="&lt;span style='font-style:italic;color:#444444;'&gt;Số ngày trước và sau ngày hiện tại&lt;span&gt;" e="&lt;span style='font-style:italic;color:#444444;'&gt;Backward Days and Forward Days&lt;span&gt;"/>
      <items style="Numeric"/>
    </field>
    <field name="number_of_date_after" type="Decimal" dataFormatString="##0" clientDefault="7">
      <header v="Số ngày hiển thị" e="Number of Date"></header>
      <items style="Numeric"/>
    </field>
    <field name="monday_yn" type="Boolean">
      <header v="Bắt đầu từ thứ hai" e="Start on Monday"></header>
      <footer v="&lt;span style='font-style:italic;color:#444444;'&gt;Chọn: bắt đầu từ thứ hai, không chọn: bắt đầu từ chủ nhật&lt;span&gt;" e="&lt;span style='font-style:italic;color:#444444;'&gt;Choose: Start on Monday, Else: Start on Sunday&lt;span&gt;"/>
    </field>
    <field name="mark_now" type="Boolean">
      <header v="Đánh dấu hiện tại" e="Mark Now"></header>
    </field>
    <field name="event_duration" type="Decimal" dataFormatString="##0" clientDefault="60">
      <header v="Khoảng thời gian" e="Event Duration"></header>
      <footer v="&lt;span style='font-style:italic;color:#444444;'&gt;Phút&lt;span&gt;" e="&lt;span style='font-style:italic;color:#444444;'&gt;Minute(s)&lt;span&gt;"/>
      <items style="Numeric"/>
    </field>
    <field name="time_step" type="Decimal" dataFormatString="##0" clientDefault="60">
      <header v="Khoảng tg ngắn nhất" e="Time Step"></header>
      <footer v="&lt;span style='font-style:italic;color:#444444;'&gt;Phút&lt;span&gt;" e="&lt;span style='font-style:italic;color:#444444;'&gt;Minute(s)&lt;span&gt;"/>
      <items style="Numeric"/>
    </field>
    <field name="max_month_events" type="Decimal" dataFormatString="1, 2, 3, 4, 5, 6, 7, 8, 9" clientDefault="5" align="right">
      <header v="Số bản ghi hiển thị" e="Max Month Events"></header>
      <items style="Mask"/>
    </field>
    <field name="active_link_view" clientDefault="week">
      <header v="Chi tiết theo" e="Active Link View"></header>
      <items style="DropDownList">
        <item value="month">
          <text v="Tháng" e="Month"/>
        </item>
        <item value="week">
          <text v="Tuần" e="Week"/>
        </item>
        <item value="day">
          <text v="Ngày" e="Day"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="first_hour" type="Decimal" dataFormatString="#0" clientDefault="0" align="right">
      <header v="Thời gian hiển thị" e="Showing Time"></header>
      <footer v="&lt;span style='font-style:italic;color:#444444;'&gt;Từ 0 tới 24h&lt;span&gt;" e="&lt;span style='font-style:italic;color:#444444;'&gt;From 0 to 24 Hour&lt;span&gt;"/>
      <items style="Numeric"/>
    </field>
    <field name="last_hour" type="Decimal" dataFormatString="#0" clientDefault="24" align="right">
      <header v="Thời gian hiển thị" e="Showing Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="muc_do_cao" dataFormatString="@upperCaseFormat">
      <header v="Cao" e="High"></header>
      <footer v="Màu các mức độ" e="Color of Priority"/>
      <items style="Mask"/>
    </field>
    <field name="muc_do_tb" dataFormatString="@upperCaseFormat">
      <header v="Bình thường" e="Normal"></header>
      <footer v="&lt;a id='defaultColorLink' href='#' style='color:#3171c6;text-decoration:none;font-style:italic;' onclick='loadDefaultColor(this);'&gt;Màu mặc định&lt;/a&gt;" e="&lt;a id='defaultColorLink' href='#' style='color:#3171c6;text-decoration:none;font-style:italic;' onclick='loadDefaultColor(this);'&gt;Default Color&lt;/a&gt;"/>
      <items style="Mask"/>
    </field>
    <field name="muc_do_thap" dataFormatString="@upperCaseFormat">
      <header v="Thấp" e="Low"></header>
      <items style="Mask"/>
    </field>

    <field name="tt_chua_thuc_hien" dataFormatString="@upperCaseFormat">
      <header v="Chưa thực hiện" e="No Action"></header>
      <footer v="Màu trạng thái" e="Color of Status"/>
      <items style="Mask"/>
    </field>
    <field name="tt_dang_thuc_hien" dataFormatString="@upperCaseFormat">
      <header v="Đang thực hiện" e="In Progress"></header>
      <items style="Mask"/>
    </field>
    <field name="tt_hoan_thanh" dataFormatString="@upperCaseFormat">
      <header v="Hoàn thành" e="Completed"></header>
      <items style="Mask"/>
    </field>
    <field name="tt_tam_dung" dataFormatString="@upperCaseFormat">
      <header v="Tạm dừng" e="Pending"></header>
      <items style="Mask"/>
    </field>

    <field name="text_color" dataFormatString="@upperCaseFormat">
      <header v="Màu chữ" e="Text Color"></header>
      <items style="Mask"/>
    </field>
    <field name="apply_now" type="Boolean" external="true" allowContain="true" defaultValue="1" clientDefault="1">
      <header v="Cập nhật ngay" e="Apply Now"></header>
      <footer v="&lt;span style='font-style:italic;color:#444444;'&gt;Chọn: tải lại trang để cập nhật tùy chọn mới&lt;span&gt;" e="&lt;span style='font-style:italic;color:#444444;'&gt;Choose: Reload Page&lt;span&gt;"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="300">
      <item value="120, 30, 30, 40, 30, 70, 100, 30, 70, 30"/>
      <item value="11110000: [number_of_date_before].Label, [number_of_date_before], [number_of_date_after], [number_of_date_before].Description"/>
      <item value="11: [mark_now].Label, [mark_now]"/>
      <item value="11100000: [monday_yn].Label, [monday_yn], [monday_yn].Description"/>
      <item value="11: [max_month_events].Label, [max_month_events]"/>
      <item value="11100001: [event_duration].Label, [event_duration], [event_duration].Description, [user_id]"/>
      <item value="11100000: [time_step].Label, [time_step], [time_step].Description"/>
      <item value="1100: [active_link_view].Label, [active_link_view]"/>
      <item value="11110000: [first_hour].Label, [first_hour], [last_hour], [first_hour].Description"/>
      <item value="11001010: [muc_do_cao].Description, [muc_do_cao].Label, [muc_do_cao], [muc_do_tb].Description"/>
      <item value="-10010: [muc_do_tb].Label, [muc_do_tb]"/>
      <item value="-10010: [muc_do_thap].Label, [muc_do_thap]"/>

      <item value="110010: [tt_chua_thuc_hien].Description, [tt_chua_thuc_hien].Label, [tt_chua_thuc_hien]"/>
      <item value="-10010: [tt_dang_thuc_hien].Label, [tt_dang_thuc_hien]"/>
      <item value="-10010: [tt_hoan_thanh].Label, [tt_hoan_thanh]"/>
      <item value="-10010: [tt_tam_dung].Label, [tt_tam_dung]"/>

      <item value="1100: [text_color].Label, [text_color]"/>
      <item value="11100000: [apply_now].Label, [apply_now], [apply_now].Description"/>
    </view>0
  </views>

  <commands>
    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EWiP+cggTmb4b0sVgxjl73VdtOTMd76uYRm7b7bhtuehoym+4RYbvqznGHyckNsHaaCD1UHfnQ1Cxz6VUnsUHWsYLZKGu8/w+NLBjtSGkZGaTOB+4RiXdqZZBYdEAOoDc7NJVn7OgkuWg87fGMTCb4cc+6XUtz24s+9gfd+qfTkZbR/kXTeqjP1jSHMEMDuhgK8MG9KTcGxk8zBXh5bdxJ8=</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758WNuP215eeaL5r2cbFM1PfjvNWBNypAgTqu9fvdFEFIAWNUBXbs3DumXCvRvHV/PQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL755KnqycUzfYriVEykC1RKEnVHaU6LBo5NpuJoQzG346AL7iqoJ5ufqJr3G6gLNS7OQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBUVd0KXzh69RNCeUn6Jkz0ai4AJNPfspJlFapSJj2vvfAYGogHC/Jbzu0/xLaOws6U74hFAMWze91Pym10EJyLUTCs2Dl4OF2zeK/u8rQWa4VWSUSYByKZp7tWjGXnbDKxPCeCkF53fRwlrNpoMXTn2xDXyhFWawWWN3cWn48JeGWzjZz7LkkdL9Q7VtHsQzOzz2L6FC55Uya1CPWAlw9PvUCWcmuZN1fWTny6u1mAuyRwPgQP0ulXwU+Bfw/8xx+iB31i3lkiH+NLdGzaWm9QcsEZrOLhuenNhUG1Pla6OREoF14BrLcE0oKLzq8Ma8tuyoH1RmD/akFFx055s8DgRba0RhMHp3JGyPL4S84znwDqK9v4gypQcBB82MMluB3zmA/bUdT3G7Ue7sTU4Zp0zXupRSMxeDfrMRsislfoG9oDf+qJEV2+YJ4K9LlwOPvBI4XMTvM3TOcXAzJx5yBmB1xL2QhkFJMJOj1oKABgQ</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtVxzfJfxyhuYSODklXN0pJu5y+KT0WLgYyc2wWrj65KvOClSwOc+eMogD8c3hE0MhgzB7ip+B0BwpFt1GlTM8mlQlLKzbGg+s85Nam7tqpydfocAzvJtHOI8gKoWCz04uqtrdCM+PJumfIATNbV/5j1jnHtNy2n3UzwbPwkUukN0AlL7e74f+RSbJiCIjcz3725TXtDVioix1mQEKJLhUVsUgW9VFBi9DDaFCtBNcAHY758H4Lkw2VGKcaoxp68yE1OrsI0K+gLkRAb7KHvKR4AcLO4m7TToVR529p1OS7+ju/TOg8+ooj00MrFcQiZKmhhvsTNF1vkdlXDyOwlxBl+nlCK0/2IOzMwplAvssUQdwnQn9fTG+J919xg0E6wtYUTNfB5uVnNwI1LgoJQ+jnHroLMkDEYd+/Hvw7Xp3w8ZoQjO+ghhmCXNjWVXlBOID10a3llBvNxhcMZiz3P/0KPTbb7lpTj75BYoftCO81LQ3gAawdVQakhiX0n97avDemgIKBi0b0oVbHL9VJmR9NzRym6w08aR+SqisiHqUZWqmzpVKLVa8xGclhdjAheAVyt4PrGmttW96Vfm1KMOfGkquebrtotgbPWZQaZ+ZFbpA4V/DOIffJpTr0Kqlqr3YpwKDX70VmxivzozDuKKmSMMbGxZ1aKXlBo7yWCucunFyfsKQQoAygo0xgaYCi8MKiuoxATDuFI5wTEay2+YOO4l3DBu6a8P1eKqNj2fkatIPVAughirIgU1K8NYesOtyAJAGk+KvO+pJz8MRXSfNQu3NTvqX8NTyJLUX68Nnc7iCBMQ9nMVBHvD9KOaWe1KhtneQc8WYXnwkFLgGu6hFVSaWOCfWoRYwjeu2jkyvcKef6jAV333dxYAvi+4zjoioOwgi4mBh1d/Pf3lsagcSsg=</Encrypted>]]>
      &OutlineEntry;
    </text>
  </script>
  <response>
    <action id="GetValues">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMhhdMaLjPPb/qvJRzCJmyaWqHLxfwC8fXZtwMyBpOsjZOGdSw3v8ZvzgPYH4G2OZyW+Ut6YORSnmUB401Q47Yhtf4ouvXxi+km8MZaqfpXTOMDvURRXxsP05M3ecQgIXMspHRjhOG6WICjATpoL3kH8Tp5fv3fffUYNImkLTywaQ+K87jWbFd8EemvOfeeKKtr0PFckkZCboKQNydVQZuRtdzNTe4KYFn6DlHNT5zW2p9ESxuGpJoI2wu2zHLwhLlJ/nUBBKGaCjmJLiUBuWss/Cp9Y6WB2QlDAvd+dQo8c9RKEs1iMQzC+PrBqWu7DUoOLYkUmVfR8KKBPa3ypOH+5KIC3ZPZB1kcUWn2B1yDP</Encrypted>]]>
      </text>
    </action>

    <action id="DefaultColor">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNgvf03Lgf+hR7WXfm9f5w1QCNPTuCprzD8qwocp7R/R+mFzTGTKouldSwHoWpVdTB4bWJK/1xYnMpCD/48t6goiW7V7M1TVGp+Yf80whgkV7kJNKdYCyrQ+ra/VVCqKNgul/agIihLiGqnZdsYNHLrsKpC6nAdSVwrTBhf0XFKyJfKSbbS/34pbOPF8lp+wfA==</Encrypted>]]>
      </text>
    </action>
  </response>
  &OutlineCss;
</dir>